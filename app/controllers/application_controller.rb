class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    fields = [:full_name, :display_name, :email, :password]
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(fields) }
    devise_parameter_sanitizer.permit(:log_in) { |u| u.permit(fields) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(fields) }
  end
end
