class GameCompaniesController < ApplicationController
  def index
    @game_companies = GameCompany.all
  end

  def show
    @game_company = GameCompany.find(params[:id])
  end

  def video_games
    @video_games = VideoGame.where(game_company_id: params[:id])
  end
end
