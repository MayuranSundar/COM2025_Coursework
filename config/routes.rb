Rails.application.routes.draw do
  
  get 'admin', to: 'admin#index'

  get 'contact', to: 'home#contact'
  post 'request_contact', to: 'home#request_contact'
  
  # CHANGE IT TO ROOT
  get 'home', to: 'home#index'

  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  
  resources :users
  resources :orders
  resources :line_items
  resources :carts
  root 'store#index', as: 'store_index'
  # root 'home#index'
  resources :phones do
    get :who_bought, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
