class ApplicationController < ActionController::Base



def after_sign_in_path_for(resource)
  stored_location_for(resource) || root_path
end

def after_sign_out_path_for(resource)
  root_path
end

before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :sex, :birthday, :email, :password, :password_confirmation, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :sex, :birthday, :profile, :email, :password, :password_confirmation, :current_password])
  end
end