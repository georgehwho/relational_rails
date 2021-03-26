class PlantsController < ApplicationController
  def index
    @plants = Plant.where(in_season: true)
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def new
  end

  def create
    plant = Plant.create(plant_params)

    redirect_to '/plants'
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