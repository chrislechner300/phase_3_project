Rails.application.routes.draw do
 
  root to: "static#home"

resources :beers, only: [:index, :show, :new, :create]




end
