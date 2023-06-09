require "test_helper"

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get employees_index_url
    assert_response :success
  end

  test "should get accept" do
    get employees_accept_url
    assert_response :success
  end

  test "should get completed" do
    get employees_completed_url
    assert_response :success
  end
end
