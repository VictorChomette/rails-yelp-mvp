class ReviewsController < ApplicationController
  # GET "restaurants/38/reviews/new" -- new -- Review;
  # POST "restaurants/38/reviews" -- create -- Review;
  before_action :set_restaurant

  def new
    @review = Review.new
  end

  def create
    # @review = Review.find(review_params)
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant), notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
