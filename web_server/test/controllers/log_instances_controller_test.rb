require 'test_helper'

class LogInstancesControllerTest < ActionController::TestCase
  setup do
    @log_instance = log_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:log_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create log_instance" do
    assert_difference('LogInstance.count') do
      post :create, log_instance: { ACTION_TIME: @log_instance.ACTION_TIME, CASH: @log_instance.CASH, CHARACTER_NO: @log_instance.CHARACTER_NO, EXP: @log_instance.EXP, IP: @log_instance.IP, LOG_NO: @log_instance.LOG_NO, LOG_TYPE: @log_instance.LOG_TYPE, MONEY: @log_instance.MONEY, USER_LV: @log_instance.USER_LV, USER_NO: @log_instance.USER_NO, VALUE: @log_instance.VALUE }
    end

    assert_redirected_to log_instance_path(assigns(:log_instance))
  end

  test "should show log_instance" do
    get :show, id: @log_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @log_instance
    assert_response :success
  end

  test "should update log_instance" do
    patch :update, id: @log_instance, log_instance: { ACTION_TIME: @log_instance.ACTION_TIME, CASH: @log_instance.CASH, CHARACTER_NO: @log_instance.CHARACTER_NO, EXP: @log_instance.EXP, IP: @log_instance.IP, LOG_NO: @log_instance.LOG_NO, LOG_TYPE: @log_instance.LOG_TYPE, MONEY: @log_instance.MONEY, USER_LV: @log_instance.USER_LV, USER_NO: @log_instance.USER_NO, VALUE: @log_instance.VALUE }
    assert_redirected_to log_instance_path(assigns(:log_instance))
  end

  test "should destroy log_instance" do
    assert_difference('LogInstance.count', -1) do
      delete :destroy, id: @log_instance
    end

    assert_redirected_to log_instances_path
  end
end
