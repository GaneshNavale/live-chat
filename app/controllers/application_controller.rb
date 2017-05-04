class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:username, :first_name, :middle_name, :last_name, :dob, :mobile, :email, :password, :password_confirmation, :current_password)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:username, :first_name, :middle_name, :last_name, :dob, :mobile, :email, :password, :password_confirmation, :current_password)
    end
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username, :password)
    end
  end  

end
