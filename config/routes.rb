Rails.application.routes.draw do
  root "expenses#index"

  get "/articles", to: "articles#index"

  resources :expenses
end
