require "test_helper"

class Api::V1::ScreenshotsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_screenshots_url
    assert_response :success
  end
end
