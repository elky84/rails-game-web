require 'test_helper'

class FriendControllerTest < ActionController::TestCase
  test "should get adventurer" do
    get :adventurer
    assert_response :success
  end

  test "should get get" do
    get :get
    assert_response :success
  end

  test "should get propose" do
    get :propose
    assert_response :success
  end

  test "should get answer" do
    get :answer
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

end
