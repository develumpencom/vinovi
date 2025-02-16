require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "gets home page" do
    get root_path

    assert_response :success
  end
end
