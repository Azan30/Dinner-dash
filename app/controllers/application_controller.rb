# frozen_string_literal: true

# Application Controller

class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end

  def configure_permitted_parameters
    fields = %i[full_name display_name email password password_confirmation avatar]
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(fields) }
    devise_parameter_sanitizer.permit(:log_in) { |u| u.permit(fields) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(fields) }
  end
end
