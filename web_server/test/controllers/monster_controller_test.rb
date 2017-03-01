require 'test_helper'

class MonsterControllerTest < ActionController::TestCase
  test "should get all" do
    get :all
    assert_response :success
  end

  test "should get save" do
    get :save
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
