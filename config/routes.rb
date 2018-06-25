Rails.application.routes.draw do
  root 'home#index'

  resources :students
  resources :payments

  devise_for :users

  get 'debtors/index'
  get 'expirations/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
