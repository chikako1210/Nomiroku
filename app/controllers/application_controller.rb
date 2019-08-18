class ApplicationController < ActionController::Base

def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
end

def after_sign_out_path_for(resource)
    root_path
end

before_action :set_search

def set_search
    if params[:q].present?
    @q = Review.ransack(params[:q])
    @reviews = @q.result.includes(:user)
    else
    params[:q] = { sorts: 'id desc' }
    @q = Review.ransack(params[:q])
    @reviews = @q.result.includes(:user)
    end
end

before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :sex, :birthday, :email, :password, :password_confirmation, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :sex, :birthday, :profile, :email, :password, :password_confirmation, :current_password])
  end

def search_params
      params.require(:q).permit(:sorts, :prefecture_eq, :brand_or_title_or_body_cont)
  end
end