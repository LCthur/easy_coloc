
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
      mail = IssueMailer.with(user: current_user, issue: @issue).request_issue
      mail.deliver
      redirect_to issues_recap_path
    else
      render :new
    end
  end

  def recap
    @my_issues = Issue.joins("INNER JOIN assignments ON issues.assignment_id = assignments.id").where("assignments.done_state = false").where(user_id: current_user.id)
    @issues_against_me = Issue.joins("INNER JOIN assignments ON issues.assignment_id = assignments.id").where("assignments.user_id = #{current_user.id}").where("assignments.done_state = false")
  end

  private

  def issue_params
    params.require(:issue).permit(:description, :photo)
  end
end
