Rails.application.routes.draw do
  devise_for :users

  authenticated(:user) do
    get "/", to: "expenses#index"
  end

  root "pages#landing"

  get "/articles", to: "articles#index"

  get "/about", to: "pages#about"

  get "/tos", to: "pages#tos"

  get "/privacy", to: "pages#privacy"

  resources :expenses

  namespace :api, defaults: { format: :json } do
    get "/hello", to: "hello#world"
  end
end
