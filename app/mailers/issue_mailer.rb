 class IssueMailer < ApplicationMailer
  include Roadie::Rails::Automatic

  def request_issue
    @user = User.find(params[:issue][:user_id])
    @assignment = Assignment.find(params[:issue][:assignment_id])
    @issue = Issue.find(params[:issue][:id])
    @target_user = @assignment.user
    mail(to: @target_user.email, subject: "#{@user.first_name} #{@user.last_name} a ouvert un ticket")
  end
end
