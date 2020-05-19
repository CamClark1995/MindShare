Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "posts#index"

  resource :login
  resources :users, only: %i[new create]
  resources :posts, only: %i[index create]
end
