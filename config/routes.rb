Rails.application.routes.draw do
  get 'login', to: 'login#index'
  post 'loginControl' , to: 'login#loginControl' , as: 'login_control'
  post 'destroy' , to: 'login#destroy' , as: 'login_destroy'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
