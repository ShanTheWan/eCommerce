Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :products
  root 'products#index'
  devise_for :users, controllers: { registrations: 'registrations' }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'checkout' => 'checkouts#show'
  get 'checkout/success' => 'checkouts#success'
  get 'billing' => 'billing#show'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
end
