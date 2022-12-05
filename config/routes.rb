Rails.application.routes.draw do
  resources :inventories
  resources :markets
  resources :items
  resources :users
  # get 'my_inventory', to: 'my_inventory#index' , as: 'inventory_pages'
  # get 'my_market', to: 'my_market#index' , as: 'market_pages'

  get 'login', to: 'login#index'
  post 'login/control' , to: 'login#loginControl' , as: 'login_control'
  post 'login/destroy' , to: 'login#destroy' , as: 'login_destroy'

  get 'my_market', to: 'my_market#index' , as: 'my_market'
  get 'my_inventory', to: 'my_inventory#index' , as: 'my_inventory'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
