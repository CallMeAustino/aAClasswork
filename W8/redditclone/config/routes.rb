Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index, :new, :create]
  resource :session, only: [:create, :new, :destroy]
  resources :subs do
    resources :posts, only: [:create]
  end
  resources :posts, except: [:create]
end
