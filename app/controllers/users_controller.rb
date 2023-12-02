class UsersController < ApplicationController
  # before_save :setType
  # @tutor_code = 'K155F34'
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    # setType()
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Добро пожаловать в TestMe :)!'
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :surname,
      :name,
      :patronymic,
      :email,
      :password,
      :password_confirmation,
      :type_user,
      :group)
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
