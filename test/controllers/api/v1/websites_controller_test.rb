require "test_helper"

class Api::V1::WebsitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @website = websites(:one)
  end

  test "should get index" do
    get api_v1_websites_url, as: :json
    assert_response :success
  end

  test "should create website" do
    assert_difference('Website.count') do
      post api_v1_websites_url, params: { website: { address: 'http://example.com' } }, as: :json
    end

    assert_response 201
  end
end
