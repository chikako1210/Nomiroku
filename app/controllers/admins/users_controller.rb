class Admins::UsersController < ApplicationController

before_action :authenticate_admin!

  def index
  	  @users = User.page(params[:page])
  end

  def show
  	  @user = User.find(params[:id])
  	  @reviews = @user.reviews.page(params[:page])
  end

  def destroy
  	  @user = User.find(params[:id])
      @user.destroy
      redirect_to users_path
  end
end
