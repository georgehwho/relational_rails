Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/game_companies', to: 'game_companies#index'
  get '/game_companies/:id', to: 'game_companies#show'
  get '/game_companies/:id/video_games', to: 'game_companies#video_games'

  get '/video_games', to: 'video_games#index'
  get '/video_games/:id', to: 'video_games#show'
end
