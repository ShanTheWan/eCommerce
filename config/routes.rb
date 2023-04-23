Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :products
  root 'products#index'
  devise_for :users, controllers: { registrations: 'registrations' }


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
end
