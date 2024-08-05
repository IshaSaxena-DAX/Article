Rails.application.routes.draw do
  resources :articles #to see the route of a particular action
  get 'about', to: 'pages#about'
 root 'pages#home'
  # Defines the root path route ("/")
  # root "posts#index"
end
