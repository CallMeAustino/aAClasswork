Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :session, only: [:create, :destroy, :new]

  resources :users, only: [:new, :create, :show]

  resources :bands
end

# bands     GET    /bands(.:format)                       bands#index
#           POST   /bands(.:format)                       bands#create
# new_band  GET    /bands/new(.:format)                   bands#new
# edit_band GET    /bands/:id/edit(.:format)              bands#edit
# band      GET    /bands/:id(.:format)                   bands#show
#           PATCH  /bands/:id(.:format)                   bands#update
#           PUT    /bands/:id(.:format)                   bands#update
#           DELETE /bands/:id(.:format)                   bands#destroy