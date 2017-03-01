require 'test_helper'

class AuthInstancesControllerTest < ActionController::TestCase
  setup do
    @auth_instance = auth_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:auth_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create auth_instance" do
    assert_difference('AuthInstance.count') do
      post :create, auth_instance: { AUTH_KEY: @auth_instance.AUTH_KEY, IP: @auth_instance.IP, PRIVATE_KEY: @auth_instance.PRIVATE_KEY, USER_NO: @auth_instance.USER_NO }
    end

    assert_redirected_to auth_instance_path(assigns(:auth_instance))
  end

  test "should show auth_instance" do
    get :show, id: @auth_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @auth_instance
    assert_response :success
  end

  test "should update auth_instance" do
    patch :update, id: @auth_instance, auth_instance: { AUTH_KEY: @auth_instance.AUTH_KEY, IP: @auth_instance.IP, PRIVATE_KEY: @auth_instance.PRIVATE_KEY, USER_NO: @auth_instance.USER_NO }
    assert_redirected_to auth_instance_path(assigns(:auth_instance))
  end

  test "should destroy auth_instance" do
    assert_difference('AuthInstance.count', -1) do
      delete :destroy, id: @auth_instance
    end

    assert_redirected_to auth_instances_path
  end
end
