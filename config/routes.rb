Rails.application.routes.draw do
  root "static_pages#home"

  get "static_pages/home"
  get "static_pages/contact"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :users
  resources :tours, only: %i(index show)

  namespace :admin do
end
end
