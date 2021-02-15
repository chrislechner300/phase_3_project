Rails.application.routes.draw do
 
  devise_for :users
  root to: "static#home"
  resources :beers
  resources :styles do
    resources :beers, only: [:new, :create, :index]
  end
end
