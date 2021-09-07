Rails.application.routes.draw do
  get 'user/index'
  root 'home#index'
  devise_for :users
  resources :courses
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
