Rails.application.routes.draw do
	resources :repairs
  resources :items
  resources :models
  resources :services
  resources :prices
  resources :news
  resources :sessions, only: [:new, :create, :destroy]

  root 'pages#home'
 
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/contact', to: 'pages#contact', via: 'get'
  match '/admin', to: 'sessions#new', via: 'get', as: :sign_in
  match '/feedback', to: 'pages#feedback', via: 'get', as: :feedback
  match '/callback', to: 'pages#call', via: 'get', as: :callback
end
