require_relative '../app/middleware/walletonemdw.rb'
Rails.application.routes.draw do
  root 'products#index'
  mount WM => '/w1_callback'
  devise_for :admins
  devise_for :users

  resources :categories
  resources :products do
    resources :comments
  end
  get 'products/:id/similar' => 'products#similar', as: :similar_product
  get 'admin_panel/categories' => 'admin_panel#categories', as: :admin_categories
  get 'admin_panel/products' => 'admin_panel#products', as: :admin_products
  get '/cart' => 'cart#index', as: :cart
  get 'cart/update' => 'cart#update', as: :cart_update
  get 'cart/clear' => 'cart#clear'
  get 'cart/:id' => 'cart#add', as: :cart_add
  get '/admin_panel' => 'admin_panel#index', as: :admin_root
  get 'page/about'
  get 'page/contact'
  post '/payorder' => 'orders#create', as: :pay_order
end
