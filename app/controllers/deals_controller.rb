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
        if deal.save
          mail = DealMailer.with(user: current_user, deal: deal).request_deal
          mail.deliver
        else
          render :new
        end
      end
    redirect_to flat_path(current_user.flat)
  end

  def recap
    # recup de tous les deals proposes au current_user
    @deals = Deal.joins("INNER JOIN assignments
                          ON deals.assignment_proposal_id = assignments.id").where("assignments.user_id = #{current_user.id}")
    @my_deals = Deal.joins("INNER JOIN assignments
                            ON deals.assignment_id = assignments.id").where("assignments.user_id = #{current_user.id}")
  end

  def update
    # On trouve le deal choisi, on le passe a chosen : true
    deal = Deal.find(params[:id])
    # echange des user
    asker = deal.assignment.user
    assignment_dealed = deal.assignment
    assignment_choosed = Assignment.find(deal.assignment_proposal_id)
    assignment_dealed.user = current_user
    assignment_choosed.user = asker
    assignment_choosed.save
    assignment_dealed.save
    deal.chosen = true
    if deal.save
      mail = DealMailer.with(user: current_user, deal: deal).confirm_deal
      mail.deliver
    end
    # On recupere toutes les autres propositions
    other_deals_proposal = Deal.where(assignment: deal.assignment).where(chosen: nil)
    other_deals_proposal.each do |deal_proposal|
      deal_proposal.chosen = false
      deal_proposal.save
    end
    redirect_to flat_path(current_user.flat)
  end

  private

  def deal_params
    params.require(:deal).permit(:assignment_proposal_id)
  end
end
