class ApplicationController < ActionController::Base
  before_action :devise_custom_params, if: :devise_controller?

  protected

  def devise_custom_params
    signup_params = [:first_name, :last_name, :username, :email]
    update_params = [:first_name, :last_name, :email]
    devise_parameter_sanitizer.permit(:sign_up, keys: signup_params)
    devise_parameter_sanitizer.permit(:account_update, keys: update_params)
  end
end
