require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get users" do
    get admin_users_url
    assert_response :success
  end

  test "should get tasks" do
    get admin_tasks_url
    assert_response :success
  end

  test "should get manage" do
    get admin_manage_url
    assert_response :success
  end
end
