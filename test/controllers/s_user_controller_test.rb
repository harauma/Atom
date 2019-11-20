require 'test_helper'

class SUserControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get s_user_top_url
    assert_response :success
  end

end
