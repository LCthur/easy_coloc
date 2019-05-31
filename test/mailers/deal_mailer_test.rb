require 'test_helper'

class DealMailerTest < ActionMailer::TestCase
  test "request_deal" do
    mail = DealMailer.request
    assert_equal "Request", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
