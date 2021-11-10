Rails.application.routes.draw do
  # GET "restaurants" -- index -- Restaurant;
  # GET "restaurants/new" -- new -- Restaurant;
  # POST "restaurants" -- create -- Restaurant;
  # GET "restaurants/38" -- show -- Restaurant;
  # GET "restaurants/38/reviews/new" -- new -- Review;
  # POST "restaurants/38/reviews" -- create -- Review;
  resources :restaurants, only: [:index, :new, :create, :show] do
    resources :reviews, only: [:new, :create]
  end
end
