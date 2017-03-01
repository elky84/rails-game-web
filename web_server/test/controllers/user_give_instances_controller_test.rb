require 'test_helper'

class UserGiveInstancesControllerTest < ActionController::TestCase
  setup do
    @user_give_instance = user_give_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_give_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_give_instance" do
    assert_difference('UserGiveInstance.count') do
      post :create, user_give_instance: { GIVE_REPLY: @user_give_instance.GIVE_REPLY, USER_NO: @user_give_instance.USER_NO }
    end

    assert_redirected_to user_give_instance_path(assigns(:user_give_instance))
  end

  test "should show user_give_instance" do
    get :show, id: @user_give_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_give_instance
    assert_response :success
  end

  test "should update user_give_instance" do
    patch :update, id: @user_give_instance, user_give_instance: { GIVE_REPLY: @user_give_instance.GIVE_REPLY, USER_NO: @user_give_instance.USER_NO }
    assert_redirected_to user_give_instance_path(assigns(:user_give_instance))
  end

  test "should destroy user_give_instance" do
    assert_difference('UserGiveInstance.count', -1) do
      delete :destroy, id: @user_give_instance
    end

    assert_redirected_to user_give_instances_path
  end
end
