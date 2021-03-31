class VideoGamesController < ApplicationController
  def index
    if params[:id]
      @game_company = GameCompany.find(params[:id])
      @video_games = @game_company.video_games
      if params[:order] == "true"
        @video_games = @game_company.video_games.order('LOWER(name)')
      elsif params[:max_players]
        @video_games = VideoGame.limit_max_players(params[:max_players])
      else
        @video_games = @game_company.video_games
      end
    else
      @video_games = VideoGame.where(is_live: true)
    end
  end

  def show
    @video_game = VideoGame.find(params[:id])
  end

  def new
    @game_company = GameCompany.find(params[:id])
  end

  def create
    game_company = GameCompany.find(params[:id])
    new_video_game = game_company.video_games.new(
      {
      name: params[:video_game][:name],
      max_players: params[:video_game][:max_players],
      is_live: params[:video_game][:is_live]

      })
      new_video_game.save

      redirect_to "/game_companies/#{game_company.id}/video_games"
  end

  def edit
    @video_game = VideoGame.find(params[:id])
  end

  def update
    updated_video_game = VideoGame.find(params[:id])
    updated_video_game.update(name: params[:video_game][:name],
                  max_players: params[:video_game][:max_players],
                  is_live: params[:video_game][:is_live])

    redirect_to "/video_games/#{params[:id]}"
  end
end
