Rails.application.routes.draw do
  get "/restaurants" => "restaurants#index"
end
