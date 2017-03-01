require 'test_helper'

class StatisticsInstancesControllerTest < ActionController::TestCase
  setup do
    @statistics_instance = statistics_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statistics_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create statistics_instance" do
    assert_difference('StatisticsInstance.count') do
      post :create, statistics_instance: { DATE: @statistics_instance.DATE, INFO: @statistics_instance.INFO, STATISTICS_NO: @statistics_instance.STATISTICS_NO, TYPE: @statistics_instance.TYPE, USER_LV: @statistics_instance.USER_LV, VALUE: @statistics_instance.VALUE }
    end

    assert_redirected_to statistics_instance_path(assigns(:statistics_instance))
  end

  test "should show statistics_instance" do
    get :show, id: @statistics_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @statistics_instance
    assert_response :success
  end

  test "should update statistics_instance" do
    patch :update, id: @statistics_instance, statistics_instance: { DATE: @statistics_instance.DATE, INFO: @statistics_instance.INFO, STATISTICS_NO: @statistics_instance.STATISTICS_NO, TYPE: @statistics_instance.TYPE, USER_LV: @statistics_instance.USER_LV, VALUE: @statistics_instance.VALUE }
    assert_redirected_to statistics_instance_path(assigns(:statistics_instance))
  end

  test "should destroy statistics_instance" do
    assert_difference('StatisticsInstance.count', -1) do
      delete :destroy, id: @statistics_instance
    end

    assert_redirected_to statistics_instances_path
  end
end
