class GardensController < ApplicationController
  def index
    @gardens = Garden.all
  end

  def new
  end

  def create
    garden = Garden.new({
      name: params[:garden][:name],
      watered: params[:garden][:watered],
      max_plant_capacity: params[:garden][:max_plant_capacity]
      })

    garden.save

    redirect_to '/gardens'
  end

  def show
    @garden = Garden.find(params[:id])
  end

  def plants
    # require 'pry'; binding.pry
    @garden_plants = Plant.where(garden_id: params[:id])
  end
end