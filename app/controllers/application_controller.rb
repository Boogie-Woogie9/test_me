# frozen_string_literal: true

# главный контроллер приложения
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  # before_action :authenticate_user!
  # check_authorization unless: devise_controller?

  # resuce_from CanCan:AccessDenied do |exception|
  #   redirect_to root_path, alert: exception.message
  # end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # задел на интернационализацию приложения
end
