require 'test_helper'

class SkillControllerTest < ActionController::TestCase
  test "should get all" do
    get :all
    assert_response :success
  end

  test "should get save" do
    get :save
    assert_response :success
  end

  test "should get enchant" do
    get :enchant
    assert_response :success
  end

  test "should get learn" do
    get :learn
    assert_response :success
  end

end
