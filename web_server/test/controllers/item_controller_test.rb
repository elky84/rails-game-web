require 'test_helper'

class ItemControllerTest < ActionController::TestCase
  test "should get all" do
    get :all
    assert_response :success
  end

  test "should get inventory" do
    get :inventory
    assert_response :success
  end

  test "should get equip" do
    get :equip
    assert_response :success
  end

  test "should get postbox" do
    get :postbox
    assert_response :success
  end

  test "should get buff" do
    get :buff
    assert_response :success
  end

  test "should get sell" do
    get :sell
    assert_response :success
  end

end
