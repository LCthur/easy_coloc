require 'test_helper'

class IssuesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get issues_new_url
    assert_response :success
  end

  test "should get create" do
    get issues_create_url
    assert_response :success
  end

end
