Rails.application.routes.draw do
 
  root to: "static#home"
  resources :beers
  resources :styles do
    resources :beers, only: [:new, :create, :index]
  end
end
