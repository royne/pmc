Rails.application.routes.draw do
  root 'home#index'

  resources :students do
    collection do
      get :import
      post :import_charge
    end
  end

  resources :payments
  resources :courses, only: [:new, :create]

  devise_for :users

  get 'debtors/index'
  get 'expirations/index'
  get 'statistics/index'
  get 'state/index'
  # descarga xlsx
  get 'xls_students', to:'students#xls_students', as:'xls_students'

  get 'admin/index'

  get 'admin/show'
  get '/admin/:id', to: 'admin#show'

  post 'students/updateUserNew', to:'students#updateUserNew'

  get 'home/costs'
  get 'home/about'
end
