Rails.application.routes.draw do
  devise_for :users
  root "expenses#index"

  get "/articles", to: "articles#index"

  get "/about", to: "pages#about"

  get "/tos", to: "pages#tos"

  get "/privacy", to: "pages#privacy"

  resources :expenses
end
