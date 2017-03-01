require 'test_helper'

class DaycheckInstancesControllerTest < ActionController::TestCase
  setup do
    @daycheck_instance = daycheck_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:daycheck_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create daycheck_instance" do
    assert_difference('DaycheckInstance.count') do
      post :create, daycheck_instance: { CHECK: @daycheck_instance.CHECK, DAYCHECK_ID: @daycheck_instance.DAYCHECK_ID, DAYCHECK_NO: @daycheck_instance.DAYCHECK_NO, TIME: @daycheck_instance.TIME, USER_NO: @daycheck_instance.USER_NO, USER_TYPE: @daycheck_instance.USER_TYPE }
    end

    assert_redirected_to daycheck_instance_path(assigns(:daycheck_instance))
  end

  test "should show daycheck_instance" do
    get :show, id: @daycheck_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @daycheck_instance
    assert_response :success
  end

  test "should update daycheck_instance" do
    patch :update, id: @daycheck_instance, daycheck_instance: { CHECK: @daycheck_instance.CHECK, DAYCHECK_ID: @daycheck_instance.DAYCHECK_ID, DAYCHECK_NO: @daycheck_instance.DAYCHECK_NO, TIME: @daycheck_instance.TIME, USER_NO: @daycheck_instance.USER_NO, USER_TYPE: @daycheck_instance.USER_TYPE }
    assert_redirected_to daycheck_instance_path(assigns(:daycheck_instance))
  end

  test "should destroy daycheck_instance" do
    assert_difference('DaycheckInstance.count', -1) do
      delete :destroy, id: @daycheck_instance
    end

    assert_redirected_to daycheck_instances_path
  end
end
