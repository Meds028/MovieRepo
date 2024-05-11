require "test_helper"

class BrowseControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get browse_new_url
    assert_response :success
  end
end
