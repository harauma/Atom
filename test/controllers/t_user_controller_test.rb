require 'test_helper'

class TUserControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get t_user_top_url
    assert_response :success
  end

end
