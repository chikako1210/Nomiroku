class LikesController < ApplicationController

  def index
      @user = User.find(params[:user_id])
      @reviews = Review.includes(:user, :likes).where(likes: {user_id: @user.id}).order("likes.created_at DESC")
  end

  def create
  	  review = Review.find(params[:review_id])
  	  like = current_user.likes.new(review_id: review.id)
  	  like.save
  	  redirect_to review_path(review)
  end

  def destroy
  	  review = Review.find(params[:review_id])
  	  like = current_user.likes.find_by(review_id: review.id)
      like.destroy
      redirect_to review_path(review)
  end

  private
  def user_params
      params.require(:user).permit(:name, :sex, :birthday, :profile, :email)
  end
end
