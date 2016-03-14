class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:about, :index]

  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:sign_in) { |u|  u.permit(:email, :password) }
  end
end
