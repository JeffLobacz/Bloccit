class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # The following 5 lines satisfies the 3rd and 4th bullet points in the assignment:
  # "Move the flash_attack filter to ApplicationController"

  before_action :flash_attack

  def flash_attack
    flash[:notice] = "Assignment All Views Flash Attack!"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
