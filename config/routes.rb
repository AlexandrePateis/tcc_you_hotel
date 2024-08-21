Rails.application.routes.draw do
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
end
