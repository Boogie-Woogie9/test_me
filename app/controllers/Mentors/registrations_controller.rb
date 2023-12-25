# frozen_string_literal: true

class Mentors::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def create
    @mentor = Mentor.new(sign_up_params)
    if @mentor.save
      sign_in(@mentor)
      flash[:success] = 'Добро пожаловать в TestMe :)!'
      redirect_to @mentor
    else
      render 'new'
    end
  end

  def destroy
    redirect_to destroy_mentor_session_path, notice: 'Ваш аккаунт успешно удален.'
    @mentor = Mentor.find(params[:id.to_i])
    @mentor.destroy
  end
  
  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[surname name email
      password password_confirmation
    ])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i[surname name])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(_resource)
  #   new_page_path
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
