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
    if @issue.save
      redirect_to flat_path(current_user.flat)
    else
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:description, :photo)
  end
end
