class GardensController < ApplicationController
  def index
    @gardens = %w[1 2 3]
  end

  def new
  end

  def create
    garden = Garden.new({
      name: params[:garden][:name],
      name: params[:garden][:watered],
      name: params[:garden][:max_plant_capacity]
      })

    garden.save

    redirect_to 'gardens'
  end

  def show
    @garden = Garden.find(params[:id])
  end
end