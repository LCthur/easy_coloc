 class InvitationMailer < ApplicationMailer
  include Roadie::Rails::Automatic

  def send_invitation(target_email)
    @user = params[:user]
    @flat = params[:flat]
    mail(to: target_email, subject: "#{@user.first_name} #{@user.last_name} vous invite à rejoindre Easy-coloc'")
  end
end

