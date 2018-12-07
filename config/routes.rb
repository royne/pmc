Rails.application.routes.draw do
  root 'home#index'

  resources :students
  resources :payments

  devise_for :users

  get 'debtors/index'
  get 'expirations/index'
  get 'statistics/index'
  get 'state/index'
  # descarga xlsx
  get 'xls_students', to:'students#xls_students', as:'xls_students'
  get 'admin/index'

end
