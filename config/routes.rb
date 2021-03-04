Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :posts, except: [:destroy]
  delete "posts/:id", to: "posts#destroy", as: "posts_destroy"
  get "/explore", to: "posts#explore"
  get "users/:id", to: "posts#friendsposts"

  resources :friends, only: [:create, :destroy]

  root "posts#index"
  
end
