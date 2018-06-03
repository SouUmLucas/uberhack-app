Rails.application.routes.draw do
  devise_for :users
  root to: 'journey#index'

  resources :journey
end
