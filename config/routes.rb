Rails.application.routes.draw do
  root 'products#index'

  devise_for :admins
  devise_for :users

  resources :categories
  resources :products do
    resources :comments
  end
  get 'admin_panel/products' => 'admin_panel#products', as: :admin_products
  get '/cart' => 'cart#index', as: 'cart'
  get 'cart/clear' => 'cart#clear'
  get 'cart/:id' => 'cart#add', as: 'cart_add'
  get '/admin_panel' => 'admin_panel#index', as: :admin_root
  get 'page/about'
  get 'page/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
