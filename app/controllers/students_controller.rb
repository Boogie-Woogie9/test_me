# frozen_string_literal: true

# контроллер для студентов
class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = 'Добро пожаловать в TestMe :)!'
      redirect_to @student
    else
      render 'new'
    end
  end

  private

  def student_params
    params.require(:student).permit(
      :surname,
      :name,
      :email,
      :password,
      :password_confirmation,
      :group
    )
  end
end
# "surname"=>"Евсеенков",
#    "name"=>"Иван",
#    "patronymic"=>"Александрович",
#    "email"=>"evseenkov.2003@mail.ru",
#    "password"=>"[FILTERED]",
#    "password_confirmation"=>"[FILTERED]",
#    "type_user"=>"0",
#    "group"=>"ИУ6-53Б"}
