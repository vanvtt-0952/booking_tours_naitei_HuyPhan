Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    devise_for :users, path_names: {sign_in: "login", sign_out: "logout", registration: "register"}

    devise_scope :user do
      get "/login", to: "devise/sessions#new"
      post "/login", to: "devise/sessions#create"
      get "/register", to: "devise/registrations#new"
      delete "/logout", to: "devise/sessions#destroy"
    end
    get "static_pages/home"
    get "static_pages/contact"
  end
end
