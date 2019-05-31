# Preview all emails at http://localhost:3000/rails/mailers/deal_mailer
class DealMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/deal_mailer/request_deal
  def request_deal
    user = User.first
    # This is how you pass value to params[:user] inside mailer definition!
    DealMailer.with(user: user).request_deal
  end

end
