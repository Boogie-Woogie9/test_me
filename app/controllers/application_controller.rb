# frozen_string_literal: true

# главный контроллер приложения
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # задел на интернационализацию приложения
end
