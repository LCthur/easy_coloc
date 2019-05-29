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
      redirect_to flat_path(current_user.flat)
    else
      render :new
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:description, :photo)
  end
end
