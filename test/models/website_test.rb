require "test_helper"

class WebsiteTest < ActiveSupport::TestCase
  setup do
    @website = websites(:one)
  end

  test "should not save Website without address" do
    website = Website.new
    assert_not website.save, "Saved the Website without an address"
  end

  test "should save Website with address" do
    website = Website.new(address: "http://example.net")
    assert website.save, "Failed to save the Website with a valid address"
  end
end
