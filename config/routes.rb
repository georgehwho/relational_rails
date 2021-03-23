Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/gardens', to: 'gardens#index'
  get '/gardens/new', to: 'gardens#new'
  post '/gardens', to: 'gardens#create'
  get '/garden/:id', to: 'gardens#show'
end
