class FlatsController < ApplicationController
  def index
    @flat = Flat.all
  end

  def show
    # @assignments = Assignment.where(user_id: @flat.user)
    @flat = Flat.find(params[:id])
    @assignments = @flat.assignments
  end
end
