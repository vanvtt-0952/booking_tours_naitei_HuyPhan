Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  root "static_pages#home"

  get "static_pages/home"
  get "static_pages/contact"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :users
  resources :reviews, only: :index
  resources :booking_tours, only: %i(index show edit update destroy)
  resources :tours, only: %i(index show) do
    resources :booking_tours, only: :create
    resources :reviews, only: %i(new create)
    collection do
      get "search"
    end
  end


  namespace :admin do
    resources :booking_tours
  end
end
