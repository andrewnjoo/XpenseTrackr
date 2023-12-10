Rails.application.routes.draw do
  devise_for :users
  root "expenses#index"

  get "/articles", to: "articles#index"

  resources :expenses
end
