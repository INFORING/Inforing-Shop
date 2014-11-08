Rails.application.routes.draw do
	resources :repairs
  resources :items
  resources :models
  resources :services
  resources :prices
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'pages#home'
 
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/contact', to: 'pages#contact', via: 'get'
  match '/admin', to: 'sessions#new', via: 'get', as: :sign_in

end
