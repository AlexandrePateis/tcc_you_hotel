Rails.application.routes.draw do
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
end
