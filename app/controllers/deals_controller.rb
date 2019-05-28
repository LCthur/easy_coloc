class DealsController < ApplicationController
  def new
    @deal = Deal.new
  end

  def create
    @deal = Deal.new(deal_params)
    @deal.user = current_user
    @task = Task.find(params[:task_id])
    @deal.task = @task
  end

  private

  def deal_params
    params.require(:deal).permit(:user_id)
  end
end
