# frozen_string_literal: true

# контроллер для прохождения тестов
class TestsController < ApplicationController
  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      flash[:success] = 'Object successfully created'
      redirect_to tests_path
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  private

  def test_params
    params.require(:test).permit(:name, :description)
  end
end
