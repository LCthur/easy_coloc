class DealsController < ApplicationController
  def new
    @user = current_user
    assignments = Assignment.where.not(user: @user)
    @proposals = assignments.select { |assignment| assignment.done_state == false }
    @deal = Deal.new
    @assignment = Assignment.find(params[:assignment_id])
    @deal.assignment = @assignment 
  end

  def create
    raise
    @assignment_to_deal = Assignment.find(params[:assignment_id])
    assignment_ids = params.keep_if {|k, v| k=~ /\d/ }.keys
    assignment = []
    assignment_ids.map { |id| assignment << Assignment.find(id.to_i) }
      assignment.each do |assignment_proposal|
        deal = Deal.new
        deal.assignment_proposal_id = assignment_proposal.id
        deal.assignment = @assignment_to_deal
        render :new unless deal.save
      end
    redirect_to flat_path(current_user.flat)
  end

  private

  def deal_params
    params.require(:deal).permit(:assignment_proposal_id)
  end
end
