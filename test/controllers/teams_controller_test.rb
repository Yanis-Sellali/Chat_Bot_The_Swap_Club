require "test_helper"

class TeamsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teams_index_url
    assert_response :success
  end
end
