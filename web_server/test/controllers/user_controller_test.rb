require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get sign_in" do
    get :sign_in
    assert_response :success
  end

  test "should get sign_up" do
    get :sign_up
    assert_response :success
  end

  test "should get heartbeat" do
    get :heartbeat
    assert_response :success
  end

  test "should get deactivate" do
    get :deactivate
    assert_response :success
  end

end
