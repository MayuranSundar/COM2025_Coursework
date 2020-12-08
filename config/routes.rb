Rails.application.routes.draw do
  
  root 'home#index'

  # get 'store/index', as: 'store_index'
  get 'store', to: 'store#index', as: 'store_index' 
  get 'admin', to: 'admin#index'
  get 'contact', to: 'home#contact'
  
  post 'request_contact', to: 'home#request_contact'

  resources :users
  resources :orders
  resources :line_items
  resources :carts
  resources :phones do
    get :who_bought, on: :member
  end

  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  
end
