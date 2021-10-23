Rails.application.routes.draw do

  resources :enrollments
  get 'user/index'
  root 'home#index'
  devise_for :users
  resources :users
  resources :courses do
    resources :lessons
    resources :enrollments, only: %i[ new create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
