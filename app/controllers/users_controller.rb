class UsersController < ApplicationController

before_action :authenticate_user!, only: [:edit, :update, :check, :destroy]
before_action :correct_user, only: [:edit, :check]


  def index
  end

  def show
      @user = User.find(params[:id])
      @reviews = @user.reviews.all
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      @user.skip_reconfirmation!
      if @user.update(user_params)
         redirect_to user_path(@user)
      else
         render :edit
      end
  end

  def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to root_path
  end

  def check
      @user = User.find(params[:id])
  end

  def correct_user
      @user = User.find(params[:id])
      if current_user != @user
         redirect_to root_path
      end
  end

  private

  def user_params
      params.require(:user).permit(:name, :sex, :birthday, :profile, :email)
  end
end
