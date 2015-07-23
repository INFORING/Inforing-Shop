Rails.application.routes.draw do
  resources :repairs
  resources :items
  resources :models
  resources :services
  resources :prices
  resources :news

  scope module: :web do
    resource :session
    resources :users
    resources :registrations
    resources :categories
    resources :subcategories
    resources :products
    resources :features
    resource :search
  end


  root 'pages#home'

  match '/contact', to: 'pages#contact', via: 'get'
  match '/feedback', to: 'pages#feedback', via: 'get', as: :feedback
  match '/callback', to: 'pages#call', via: 'get', as: :callback
  match '/repair_computer', to: 'pages#repair_computer', via: 'get'
  match '/repair_print', to: 'pages#repair_print', via: 'get'
  match '/repair_apple', to: 'pages#repair_apple', via: 'get'
  match '/repair_mobile', to: 'pages#repair_mobile', via: 'get'
  match '/repair_game', to: 'pages#repair_game', via: 'get'
  match '/repair_notebook', to: 'pages#repair_notebook', via: 'get'
  match '/repair_tablet', to: 'pages#repair_tablet', via: 'get'
  match '/payment', to: 'pages#payment', via: 'get'
  match '/pay', to: 'pages#pay', via: 'get', as: :pay
  match '/order', to: 'pages#order', via: 'get'
  match '/order_parts', to: 'pages#order_parts', via: 'post', as: :order_parts
  match '/show_picture', to: 'pages#show_picture', via: 'get', as: :show_picture
end
