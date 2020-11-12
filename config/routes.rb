Rails.application.routes.draw do
  get 'furimas/index'
  devise_for :users
  root to: "furimas#index"
  resources :furimas, only: :index
end
