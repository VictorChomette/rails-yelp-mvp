class RestaurantsController < ApplicationController
  # GET "restaurants" -- index -- Restaurant;
  # GET "restaurants/new" -- new -- Restaurant;
  # POST "restaurants" -- create -- Restaurant;
  # GET "restaurants/38" -- show -- Restaurant;
  before_action :find_restaurant, only: [:show]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant), notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
