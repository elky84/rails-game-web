require 'test_helper'

class FriendInstancesControllerTest < ActionController::TestCase
  setup do
    @friend_instance = friend_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:friend_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create friend_instance" do
    assert_difference('FriendInstance.count') do
      post :create, friend_instance: { FRIEND_NO: @friend_instance.FRIEND_NO, FRIEND_USER_ADV_TOGETHER_DATE: @friend_instance.FRIEND_USER_ADV_TOGETHER_DATE, FRIEND_USER_NO: @friend_instance.FRIEND_USER_NO, FRIEND_USER_SEND_POINT_DATE: @friend_instance.FRIEND_USER_SEND_POINT_DATE, IS_BOT: @friend_instance.IS_BOT, STATE: @friend_instance.STATE, USER_ADV_TOGETHER_DATE: @friend_instance.USER_ADV_TOGETHER_DATE, USER_NO: @friend_instance.USER_NO, USER_SEND_POINT_DATE: @friend_instance.USER_SEND_POINT_DATE }
    end

    assert_redirected_to friend_instance_path(assigns(:friend_instance))
  end

  test "should show friend_instance" do
    get :show, id: @friend_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @friend_instance
    assert_response :success
  end

  test "should update friend_instance" do
    patch :update, id: @friend_instance, friend_instance: { FRIEND_NO: @friend_instance.FRIEND_NO, FRIEND_USER_ADV_TOGETHER_DATE: @friend_instance.FRIEND_USER_ADV_TOGETHER_DATE, FRIEND_USER_NO: @friend_instance.FRIEND_USER_NO, FRIEND_USER_SEND_POINT_DATE: @friend_instance.FRIEND_USER_SEND_POINT_DATE, IS_BOT: @friend_instance.IS_BOT, STATE: @friend_instance.STATE, USER_ADV_TOGETHER_DATE: @friend_instance.USER_ADV_TOGETHER_DATE, USER_NO: @friend_instance.USER_NO, USER_SEND_POINT_DATE: @friend_instance.USER_SEND_POINT_DATE }
    assert_redirected_to friend_instance_path(assigns(:friend_instance))
  end

  test "should destroy friend_instance" do
    assert_difference('FriendInstance.count', -1) do
      delete :destroy, id: @friend_instance
    end

    assert_redirected_to friend_instances_path
  end
end
