require 'test_helper'

class StampControllerTest < ActionController::TestCase
  test "should get set" do
    get :set
    assert_response :success
  end

  test "should get get" do
    get :get
    assert_response :success
  end

  test "should get reward" do
    get :reward
    assert_response :success
  end

end
