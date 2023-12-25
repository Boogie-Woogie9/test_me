# frozen_string_literal: true

# контроллер для студентов
class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    appropriate_group = Group.find(@student.group_id)
    @available_quizzes = Quiz.joins(mentor: { groups_mentors: :group })
    .where(groups: { id: @student.group.id })
    @classmates = Student.where(group_id: @student.group_id)
    @attempts = QuizSubmission.where(student_id: params[:id])
  end

  def new
    @student = Student.new
  end

  def destroy
    redirect_to root_path, notice: 'Ваш аккаунт успешно удален.'
    @student = Student.find(params[:id])
    @student.destroy
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
