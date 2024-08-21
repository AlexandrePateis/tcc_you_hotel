Rails.application.routes.draw do
  get 'dfc_reports/index'
  get 'dre_reports/index'
  devise_for :users
  resources :financial_classes
  resources :transactions
  resources :orders
  resources :payments
  resources :guests
  resources :addresses
  resources :payment_methods
  resources :financial_accounts
  resources :hotels
  resources :rooms
  root 'dashboard#index'
  # Outras rotas podem ser adicionadas aqui
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  resources :dre_reports, only: [:index]
  resources :dfc_reports, only: [:index]

end
