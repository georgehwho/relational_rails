Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/gardens', to: 'gardens#index'
  get '/gardens/new', to: 'gardens#new'
  post '/gardens', to: 'gardens#create'
  get '/gardens/:id', to: 'gardens#show'

  get '/plants', to: 'plants#index'
  get '/plants/:id', to: 'plants#show'

end
