Rails.application.routes.draw do
 
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: "static#home"
  resources :beers
  resources :styles do
    resources :beers, only: [:new, :create, :index]
  end
end
