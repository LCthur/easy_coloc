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
    description = params[:description]
    @assignment_to_deal = Assignment.find(params[:assignment_id])
    assignment_ids = params.keep_if { |k, _v| k =~ /\d/ }.keys
    assignment = []
    assignment_ids.map { |id| assignment << Assignment.find(id.to_i) }
      assignment.each do |assignment_proposal|
        deal = Deal.new
        deal.description = description
        deal.assignment_proposal_id = assignment_proposal.id
        deal.assignment = @assignment_to_deal
        render :new unless deal.save
      end
    redirect_to flat_path(current_user.flat)
  end

  def recap
    # recup de tous les deals proposes au current_user
    @deals = Deal.joins("INNER JOIN assignments
                          ON deals.assignment_proposal_id = assignments.id").where("assignments.user_id = #{current_user.id}")
  end

  private

  def deal_params
    params.require(:deal).permit(:assignment_proposal_id)
  end
end
