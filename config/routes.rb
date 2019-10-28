Rails.application.routes.draw do
  
  #Se le da una ruta personalizada a las rutas que trae por default 'devise'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  
  #Método para cambiar la ruta a un evento si se pasa de público a privado
  resources :events do 
    member do
      get :toggle_status
    end
    put :sort, on: :collection
  end

  #Se personaliza la ruta para el menú y para los eventos
  get 'menu', to: 'pages#menu'
  get 'eventos', to: 'pages#event'

  #Se personaliza la ruta para mostrar los eventos, ventas, órdenes
  get 'product/:id', to: 'products#show', as: 'product_show'
  get 'order/:id', to: 'orders#show', as: 'order_show'
  get 'sell/:id', to: 'sells#show', as: 'sell_show'

  #Las rutas quedan como están por default, excepto para los métodos show
  resources :sells, except: [:show]
  resources :products, except: [:show]
  resources :orders, except: [:show]
  
  #Se indica la página principal
  root to: 'pages#home' 

end
