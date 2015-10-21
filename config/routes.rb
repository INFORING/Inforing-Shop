Rails.application.routes.draw do

  scope module: :web do

    root 'service/pages#home'

    namespace :admin do
      root 'pages#index'
      resource :session

      namespace :shop do
        root 'categories#index'
        resources :users
        resources :orders
        resources :categories
        resources :subcategories do
          scope module: :subcategories do
            resource :feature
          end
        end
        resources :products do
          scope module: :products do
            resource :feature
          end
        end
      end
    end

    scope module: :service do
      resources :repairs
      resources :items
      resources :models
      resources :services
      resources :prices
      resources :news
    end


    scope module: :shop do
      resource :session
      resources :users do
        collection do
          get 'order_edit', as: :order_edit
          patch 'order_update', as: :order_update
        end
      end
      resources :registrations do
        collection do
          get 'new_from_order', as: :new_order
          post 'create_from_order', as: :order
        end
      end
      resources :categories, only: [:index, :show]
      resources :subcategories, only: [:index, :show]
      resources :features
      resource :search, only: [:show]
      resources :products, only: [:index, :show]
      resource :cart, only: [:destroy]
      resources :orders, only: [:create, :update, :new]
      namespace :cart do
        resources :items, only: [:create, :update, :destroy]
      end

      get '/products/index_by_category/:id', to: 'products#index_by_category'
      get '/products/index_by_subcategory/:id', to: 'products#index_by_subcategory'
    end
  end

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
  # match '/order', to: 'web/service/pages#order', via: 'get'
  match '/order_parts', to: 'web/service/pages#order_parts', via: 'post', as: :order_parts
  match '/show_picture', to: 'web/service/pages#show_picture', via: 'get', as: :show_picture
end
