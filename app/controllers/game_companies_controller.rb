class GameCompaniesController < ApplicationController
  def index
    @game_companies = GameCompany.all
  end

  def show
    @game_company = GameCompany.find(params[:id])
    @game_company_games = VideoGame.where(game_company_id: params[:id])
  end

  def video_games
    @video_games = VideoGame.where(game_company_id: params[:id])
  end

  def new
  end

  def create
    create_game_company = GameCompany.new({
      title: params[:game_company][:title],
      employees: params[:game_company][:employees],
      profitable: params[:game_company][:profitable]
      })
    create_game_company.save

  redirect_to '/game_companies'
  end

  def edit
    @game_company = GameCompany.find(params[:id])
  end

  def update
    # binding.pry
    updated_game_company = GameCompany.find(params[:id])
    updated_game_company.update(title: params[:game_company][:title],
                  employees: params[:game_company][:employees],
                  profitable: params[:game_company][:profitable])

    redirect_to "/game_companies/#{params[:id]}/"
  end
end
