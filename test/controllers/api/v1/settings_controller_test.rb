require "test_helper"

class Api::V1::SettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    patch api_v1_settings_url, params: { setting: { interval: 10, retention: 5 } }
    assert_response :success
  end
end
