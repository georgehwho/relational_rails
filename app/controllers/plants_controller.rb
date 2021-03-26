class PlantsController < ApplicationController
  def index
    if params[:garden_id]
      @garden = Garden.find(params[:garden_id])
      @plants = @garden.plants
    else
      @plants = Plant.where(in_season: true)
    end
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def new
    @garden = Garden.find(params[:garden_id]) if params[:garden_id]
  end

  def create
    if params[:garden_id].present?
      garden = Garden.find(params[:garden_id])
      garden.plants.create(plant_params)
      redirect_to "/gardens/#{ params[:garden_id] }/plants"
    else
      plant = Plant.create(plant_params)
      redirect_to '/plants'
    end
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    plant = Plant.find(params[:id])
    plant.update(plant_params)

    redirect_to "/plants/#{ params[:id] }"
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :in_season, :age, :garden_id)
  end
end