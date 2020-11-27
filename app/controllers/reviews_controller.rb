class ReviewsController < ApplicationController
  before_action :set_restaurant

  # def new
  #   # @restaurant = Restaurant.find(params[:restaurant_id]) provided from line 4
  #   @review = Review.new
  # end

  def create
    # @restaurant = Restaurant.find(params[:restaurant_id]) provided from line 4
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    # @review.save unnecessary; line below runs save as part of if condition
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
