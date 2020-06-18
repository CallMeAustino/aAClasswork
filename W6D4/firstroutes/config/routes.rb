Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create,:update,:show,:index,:destroy] do
    resources :artworks, only: [:index]
end

  resources :artworks, only: [:create,:update,:show,:index,:destroy]

  resources :artworkshares, only: [:create,:destroy]

end


# get '/laughs', to: 'laughs#index' as: 'user'
# post '/laughs', to: 'laughs#create' as: 'user'
# get units/new(.:format) units#new <==== 
# get units/:id/edit(.:format) units#edit
# get 'users/:id', to: 'laughs#show', as: 'user'
# patch 'users/:id', to: 'laughs#update', as: 'user'
# put 'users/:id', to: 'laughs#update', as: 'user' <======
# delete 'users/:id', to: 'laughs#destroy', as: 'user'


# get 'users/:id', to: 'users#show', as: 'user'