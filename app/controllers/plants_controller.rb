class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :edit, :update, :destroy]

  def index
    if params[:garden_id]
      @garden = Garden.find(params[:garden_id])
      params[:sorted] == "true" ? @plants = @garden.plants.order('LOWER(name)') : @plants = @garden.plants
    else
      @plants = Plant.where(in_season: true)
    end
  end

  def show
  end

  def new
    @garden = Garden.find(params[:garden_url_id]) if params[:garden_url_id]
  end

  def create
    if params[:garden_url_id].present?
      garden = Garden.find(params[:garden_id])
      garden.plants.create(plant_params)
      redirect_to "/gardens/#{ params[:garden_id] }/plants"
    else
      Plant.create(plant_params)
      redirect_to '/plants'
    end
  end

  def edit
  end

  def update
    @plant.update(plant_params)

    redirect_to "/plants/#{ params[:id] }"
  end

  def destroy
    @plant.destroy

    redirect_to '/plants'
  end

  private

  def plant_params
    params.permit(:name, :in_season, :age, :garden_id)
  end

  def set_plant
    @plant = Plant.find(params[:id])
  end
end