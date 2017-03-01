require 'test_helper'

class StageControllerTest < ActionController::TestCase
  test "should get all" do
    get :all
    assert_response :success
  end

  test "should get save" do
    get :save
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

end
