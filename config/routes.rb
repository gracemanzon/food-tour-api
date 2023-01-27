Rails.application.routes.draw do
  get "/locations" => "locations#index"
  get "/restaurants" => "restaurants#index"
end
