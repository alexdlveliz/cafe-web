Rails.application.routes.draw do
  
  resources :events do 
    member do
      get :toggle_status
    end
  end

  get 'menu', to: 'pages#menu'
  get 'eventos', to: 'pages#event'
  get 'product/:id', to: 'products#show', as: 'product_show'
  get 'order/:id', to: 'orders#show', as: 'order_show'
  get 'sell/:id', to: 'sells#show', as: 'sell_show'

  resources :sells, except: [:show]
  resources :products, except: [:show]
  resources :orders, except: [:show]
  
  root to: 'pages#home' #Se indica la página principal

end
