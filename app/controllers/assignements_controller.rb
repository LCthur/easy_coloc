class AssignementsController < ApplicationController
  def update
    @assignment = Assignment.find(params[:id])
    @assignment.update(params[:assignment])
  end
end
