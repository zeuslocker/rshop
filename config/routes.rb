Rails.application.routes.draw do
  devise_for :users

  get '/cart' => 'cart#index', as: 'cart'
  get 'cart/clear' => 'cart#clear'
  get 'cart/:id' => 'cart#add', as: 'cart_add'
  resources :categories
  resources :products do
    resources :comments
  end

  root 'products#index'

  get 'page/about'

  get 'page/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
