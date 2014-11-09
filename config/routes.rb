Rails.application.routes.draw do
	resources :repairs
  resources :items
  resources :models
  resources :services
  resources :prices
  resources :sessions, only: [:new, :create, :destroy]

  root 'pages#home'
 
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/contact', to: 'pages#contact', via: 'get'
  match '/admin', to: 'sessions#new', via: 'get', as: :sign_in
<<<<<<< HEAD
=======
  match '/feedback', to: 'pages#feedback', via: 'get', as: :feedback
>>>>>>> aa951fd0617d1688f24719ceeafb370905b3d8c2

end
