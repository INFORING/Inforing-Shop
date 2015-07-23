Rails.application.routes.draw do

  scope module: :web do

    resource :session
    resources :users
    resources :registrations

    scope module: :service do
      resources :repairs
      resources :items
      resources :models
      resources :services
      resources :prices
      resources :news
    end


    scope module: :shop do
      resources :categories
      resources :subcategories
      resources :products
      resources :features
      resource :search
    end
  end


  root 'web/service/pages#home'

  match '/contact', to: 'web/service/pages#contact', via: 'get'
  match '/feedback', to: 'web/service/pages#feedback', via: 'get', as: :feedback
  match '/callback', to: 'web/service/pages#call', via: 'get', as: :callback
  match '/repair_computer', to: 'web/service/pages#repair_computer', via: 'get'
  match '/repair_print', to: 'web/service/pages#repair_print', via: 'get'
  match '/repair_apple', to: 'web/service/pages#repair_apple', via: 'get'
  match '/repair_mobile', to: 'web/service/pages#repair_mobile', via: 'get'
  match '/repair_game', to: 'web/service/pages#repair_game', via: 'get'
  match '/repair_notebook', to: 'web/service/pages#repair_notebook', via: 'get'
  match '/repair_tablet', to: 'web/service/pages#repair_tablet', via: 'get'
  match '/payment', to: 'web/service/pages#payment', via: 'get'
  match '/pay', to: 'web/service/pages#pay', via: 'get', as: :pay
  match '/order', to: 'web/service/pages#order', via: 'get'
  match '/order_parts', to: 'web/service/pages#order_parts', via: 'post', as: :order_parts
  match '/show_picture', to: 'web/service/pages#show_picture', via: 'get', as: :show_picture
end
