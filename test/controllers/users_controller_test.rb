require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bill = users(:bill)
    @jeff = users(:jeff)
  end

  test "should get index" do
    get root_url
    assert_response :success
  end
end
