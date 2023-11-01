require "test_helper"

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get splash" do
    get static_splash_url
    assert_response :success
  end
end
