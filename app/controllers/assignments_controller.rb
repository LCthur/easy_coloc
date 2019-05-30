class AssignmentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update
    @assignment = Assignment.find(params[:id])
    @assignment.done_state = true
    @assignment.save
  end
end
