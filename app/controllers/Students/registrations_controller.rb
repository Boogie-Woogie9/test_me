# frozen_string_literal: true

# контроллер регистрации и изменений в учетной записи
class Students::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # before_action :configure_group, only: [:configure_sign_up_params]

  # def configure_group
  #   sign_up_params[:group] = sign_up_params[:group].to_i
  # end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    create_params = sign_up_params
    create_params[:study_group] = create_params[:study_group].to_i
    puts "###########{create_params[:study_group].class}##########"
    puts 

    @student = Student.new(create_params)
    if @student.save
      flash[:success] = 'Добро пожаловать в TestMe :)!'
      redirect_to @student
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
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[surname name email
      password password_confirmation study_group])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
