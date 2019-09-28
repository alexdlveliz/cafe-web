Rails.application.routes.draw do
  
  get 'menu', to: 'pages#menu'
  get 'eventos', to: 'pages#event'

  resources :sells
  resources :products
  resources :orders
  
  root to: 'pages#home' #Se indica la página principal

end
