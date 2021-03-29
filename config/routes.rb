Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/game_companies', to: 'game_companies#index'
  get '/game_companies/new', to: 'game_companies#new'
  post '/game_companies', to: 'game_companies#create'
  get "/game_companies/:id/edit", to: 'game_companies#edit'
  get '/game_companies/:id', to: 'game_companies#show'
  get '/game_companies/:id/video_games', to: 'game_companies#video_games'
  get '/game_companies/:id/video_games/new', to: 'video_games#new'
  patch '/game_companies/:id', to: 'game_companies#update'

  get '/video_games', to: 'video_games#index'
  get '/video_games/:id', to: 'video_games#show'
  get '/video_games/:id/edit', to: 'video_games#edit'
  post '/game_companies/:id/video_games', to: 'video_games#create'
  patch '/video_games/:id', to: 'video_games#update'

  get '/gardens', to: 'gardens#index'
  get '/gardens/new', to: 'gardens#new'
  post '/gardens', to: 'gardens#create'
  get '/gardens/:id', to: 'gardens#show'
  get '/gardens/:garden_id/plants', to: 'plants#index'
  get '/gardens/:id/edit', to: 'gardens#edit'
  patch '/gardens/:id', to: 'gardens#update'

  get '/gardens/:garden_id/plants/new', to: 'plants#new'
  post '/gardens/:garden_id/plants', to: 'plants#create'

  get '/plants', to: 'plants#index'
  get '/plants/new', to: 'plants#new'
  post '/plants', to: 'plants#create'
  get '/plants/:id', to: 'plants#show'
  get '/plants/:id/edit', to: 'plants#edit'
  patch '/plants/:id', to: 'plants#update'
end
