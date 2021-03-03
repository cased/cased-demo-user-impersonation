require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ceo = users(:ceo)
    @employee = users(:employee)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end
end
