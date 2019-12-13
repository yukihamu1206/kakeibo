Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show,:edit,:update,:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products
  resources :categories, shallow: true
  get 'setting', to: 'settings#show'
end
