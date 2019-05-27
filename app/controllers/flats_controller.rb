class FlatsController < ApplicationController
  def index
    @flat = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end
end
