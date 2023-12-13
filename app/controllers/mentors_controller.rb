# frozen_string_literal: true

# контроллер для преподавателей
class MentorsController < ApplicationController
  def show
    @mentor = Mentor.find(params[:id])
  end

  def new
    @mentor = Mentor.new
  end

  def destroy
    redirect_to root_path, notice: 'Ваш аккаунт успешно удален.'
    @mentor = Mentor.find(params[:id])
    @mentor.destroy
  end

  def create
    @mentor = Mentor.new(mentor_params)
    if @mentor.save
      flash[:success] = 'Добро пожаловать в TestMe :)!'
      redirect_to @mentor
    else
      render 'new'
    end
  end

  private

  def mentor_params
    params.require(:mentor).permit(
      :surname,
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
