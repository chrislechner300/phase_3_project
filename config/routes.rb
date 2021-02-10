Rails.application.routes.draw do
 
  resources :styles
  root to: "static#home"

resources :beers




end
