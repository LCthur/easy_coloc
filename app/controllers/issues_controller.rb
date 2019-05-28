class IssuesController < ApplicationController
  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)
  end

  private

  def issue_params
    params.require(:issue).permit(:photo, :description)
  end
end
