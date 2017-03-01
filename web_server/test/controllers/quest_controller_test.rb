require 'test_helper'

class QuestControllerTest < ActionController::TestCase
  test "should get set" do
    get :set
    assert_response :success
  end

  test "should get get" do
    get :get
    assert_response :success
  end

  test "should get drop" do
    get :drop
    assert_response :success
  end

  test "should get clear" do
    get :clear
    assert_response :success
  end

end
