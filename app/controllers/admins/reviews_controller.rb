class Admins::ReviewsController < ApplicationController

before_action :authenticate_admin!

  def index
  	  @reviews = Review.all.includes(:user)
  end

  def show
  	  @review = Review.find(params[:id])
      @user = @review.user
  end

  def destroy
  	  @review = Review.find(params[:id])
      @review.destroy
      redirect_to reviews_path
  end
end
