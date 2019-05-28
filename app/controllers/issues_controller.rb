class IssuesController < ApplicationController
  def new
    @issue = Issue.new
    @user = current_user
    assignment = Assignment.find(params[:assignment_id])
    @task = assignment.task
    @user = assignment.user
  end

  def create
    @issue = Issue.new(issue_params)
  end

  private

  def issue_params
    params.require(:issue).permit(:photo, :description)
  end
end
