class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    update_attrs = [:name, :login_trainline, :password_trainline, :password, :password_confirmation]
    devise_parameter_sanitizer.permit(:account_update, keys: update_attrs)
  end
end
