Rails.application.routes.draw do
  resources :inventories
  resources :markets
  get 'my_inventory/index'
  resources :items
  resources :users

  get 'login', to: 'login#index'
  post 'loginControl' , to: 'login#loginControl' , as: 'login_control'
  post 'destroy' , to: 'login#destroy' , as: 'login_destroy'

  get 'my_market', to: 'my_market#index' , as: 'my_market'
  get 'my_inventory', to: 'my_inventory#index' , as: 'my_inventory'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
