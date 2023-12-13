# frozen_string_literal: true

class Mentors::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    @mentor = Mentor.new(sign_up_params)
    if @mentor.save
      sign_in(@mentor)
      flash[:success] = 'Добро пожаловать в TestMe :)!'
      redirect_to after_sign_in_path_for(@mentor)
    else
      render 'new'
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   @mentor = Mentor.find(params[:id])
  #   @mentor.destroy
  #   redirect_to root_path, notice: 'Учетная запись удалена'
  # end
  # def destroy
  #   log_out @mentor
  #   @user.destroy
  #   respond_to do |format|
  #     format.html { redirect_to login_path, notice: 'user was successfully destroyed.' }
  #   end
  # end
  def destroy
    redirect_to destroy_mentor_session_path, notice: 'Ваш аккаунт успешно удален.'
    @mentor = Mentor.find(params[:id.to_i])
    @mentor.destroy
  end
  # def destroy
  #   current_mentor.destroy
  #   sign_out(current_mentor)
  #   redirect_to root_path, notice: 'Ваш аккаунт успешно удален.'
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

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
  def after_sign_up_path_for(_resource)
    new_page_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
