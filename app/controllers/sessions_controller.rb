class SessionsController < ApplicationController
  def new
  end

  def create
    student = Student.find_by(email: params[:session][:email].downcase)
    if student && student.authenticate(params[:session][:password])
      log_in student
      redirect_to student        # Осуществить вход пользователя и переадресовать на страницу профиля.
    else
      # Создать сообщение об ошибке.
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
