# frozen_string_literal: true

# контроллер для прохождения тестов
class TestsController < ApplicationController
  def new
    @test = current_mentor.tests.build
  end

  def create
    @test = current_mentor.tests.build(test_params)
    if @test.save
      flash[:success] = 'Object successfully created'
      redirect_to tests_path
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def edit
    @test = Test.find(params[:id])
  end

  def update
    @test = Test.find(params[:id])
    if @test.update(test_params)
      redirect_to tests_path, notice: 'Test was successfully updated'
    else
      render 'edit'
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
