Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :posts, except: [:destroy]

  root "posts#index"
  delete "posts/:id", to: "posts#destroy", as: "posts_destroy"


end
