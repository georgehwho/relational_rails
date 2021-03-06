class GardensController < ApplicationController
  before_action :set_garden, only: [:show, :edit, :update, :destroy]

  def index
    @gardens = Garden.sort_by_creation_time
  end

  def new
    @garden = Garden.new
  end

  def create
    garden = Garden.create(garden_params)

    redirect_to '/gardens'
  end

  def show
  end

  def edit
  end

  def update
    @garden.update(garden_params)

    redirect_to "/gardens/#{params[:id]}"
  end

  def destroy
    @garden.destroy

    redirect_to "/gardens"
  end

  private

    def garden_params
      params.permit(:name, :watered, :max_plant_capacity)
    end

    def set_garden
      @garden = Garden.find(params[:id])
    end
end
