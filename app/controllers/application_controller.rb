class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def respond_modal_with(*args, &blk)
    options = args.extract_options!
    options[:responder] = ModalResponder
    respond_with *args, options, &blk
  end

protected

 def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :email, :password, :password_confirmation, :remember_me])

# 	  devise_parameter_sanitizer.permit(:sign_up) << :first_name
#    devise_parameter_sanitizer.for(:account_update) << :first_name
#    devise_parameter_sanitizer.for(:sign_up) << :last_name
#    devise_parameter_sanitizer.for(:account_update) << :last_name
#    devise_parameter_sanitizer.for(:sign_up) << :username
#    devise_parameter_sanitizer.for(:account_update) << :username
#    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :current_password, :avatar) }
 end
end
