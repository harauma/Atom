require 'test_helper'

class AppliControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get appli_new_url
    assert_response :success
  end

end
