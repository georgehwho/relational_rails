class GardensController < ApplicationController
  def index
    @gardens = %w[1 2 3]
  end
end