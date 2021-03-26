class PlantsController < ApplicationController
  def index
    @plants = Plant.all
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

  end

  private

  def plant_params
    params.require(:plant).permit(:name, :in_season, :age, :garden_id)
  end
end