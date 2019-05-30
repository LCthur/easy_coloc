require 'test_helper'

class AssignementsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get assignements_update_url
    assert_response :success
  end

end
