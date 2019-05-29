class IssuesController < ApplicationController
  def new
    @issue = Issue.new
    @assignment = Assignment.find(params[:assignment_id])
    @task = @assignment.task
    @user = @assignment.user
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.assignment = Assignment.find(params[:assignment_id])
    @issue.user = current_user
    if @issue.save
      # chgt de statut pour le boolean done_state
      @issue.assignment.done_state = false
      @issue.assignment.save
      redirect_to flat_path(current_user.flat)
    else
      render :new
    end
  end

  def recap
    @issues = Issue.joins("INNER JOIN assignments ON issues.assignment_id = assignments.id").where("assignments.user_id = #{current_user.id}")
  end

  private

  def issue_params
    params.require(:issue).permit(:description, :photo)
  end
end
