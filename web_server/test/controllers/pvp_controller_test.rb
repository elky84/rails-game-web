require 'test_helper'

class PvpControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get get" do
    get :get
    assert_response :success
  end

  test "should get set" do
    get :set
    assert_response :success
  end

  test "should get serch" do
    get :serch
    assert_response :success
  end

  test "should get change" do
    get :change
    assert_response :success
  end

end
