Rails.application.routes.draw do
  devise_for :users
  root "expenses#index"

  get "/articles", to: "articles#index"

  get "/about", to: "pages#about"

  resources :expenses
end
