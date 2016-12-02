Rails.application.routes.draw do
  devise_for :users

  get '/cart' => 'cart#index'
  get 'cart/clear' => 'cart#clear'
  get 'cart/:id' => 'cart#add'

  resources :products
  resources :images
  root 'page#home'

  get 'page/about'

  get 'page/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
