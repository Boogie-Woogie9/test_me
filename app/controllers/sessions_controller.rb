class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user        # Осуществить вход пользователя и переадресовать на страницу профиля.
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