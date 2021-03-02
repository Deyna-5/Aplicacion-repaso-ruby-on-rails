Rails.application.routes.draw do
  
  resources :posts, except: [:destroy]

  root "posts#index"
  delete "posts/:id", to: "posts#destroy", as: "posts_destroy"


end
