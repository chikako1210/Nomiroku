class LikesController < ApplicationController

  before_action :set_variables, only: [:create, :destroy]

  def index
      @user = User.find(params[:user_id])
      @reviews = Review.includes(:user, :likes).where(likes: {user_id: @user.id}).order("likes.created_at DESC")
  end

  def create
  	  like = current_user.likes.new(review_id: @review.id)
  	  like.save
  end

  def destroy
  	  like = current_user.likes.find_by(review_id: @review.id)
      like.destroy
  end

  private
  def set_variables
      @review = Review.find(params[:review_id])
      @id_name = "#like-link-#{@review.id}"
  end
end
