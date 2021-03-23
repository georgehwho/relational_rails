class GardensController < ApplicationController
  def index
    @gardens = %w[1 2 3]
  end

  def new
  end

  def create
    binding.pry
  end
end