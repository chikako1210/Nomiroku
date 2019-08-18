class ReviewsController < ApplicationController

before_action :authenticate_user!, only: [:new, :edit, :update, :create, :destroy]
before_action :correct_user, only: [:edit]

  def top
  end

  def new
      @review = Review.new
  end

  def create
      @review = Review.new(review_params)
      @review.user_id = current_user.id
      if @review.save
         redirect_to review_path(@review.id)
      else
         render :new
      end
  end

  def index
      @reviews = Review.all.includes(:user)
  end

  def search
  end

  def show
      @review = Review.find(params[:id])
      @user = @review.user
  end

  def edit
      @review = Review.find(params[:id])
  end

  def update
      @review = Review.find(params[:id])
      if @review.update(review_params)
         redirect_to review_path(@review)
      else
         render :edit
      end
  end

  def destroy
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to user_path(@review.user)
  end

  def correct_user
      review = Review.find(params[:id])
      user = review.user
      if current_user != user
         redirect_to root_path
      end
  end

  private

  def review_params
      params.require(:review).permit(:prefecture, :brand, :title, :image, :body)
  end
end
