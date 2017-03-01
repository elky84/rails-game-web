require 'test_helper'

class ReportInstancesControllerTest < ActionController::TestCase
  setup do
    @report_instance = report_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:report_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report_instance" do
    assert_difference('ReportInstance.count') do
      post :create, report_instance: { ACTION_TIME: @report_instance.ACTION_TIME, CHARACTER_NO: @report_instance.CHARACTER_NO, EXP: @report_instance.EXP, IP: @report_instance.IP, REPORT_NO: @report_instance.REPORT_NO, REPORT_TYPE: @report_instance.REPORT_TYPE, USER_LV: @report_instance.USER_LV, USER_NO: @report_instance.USER_NO, VALUE: @report_instance.VALUE }
    end

    assert_redirected_to report_instance_path(assigns(:report_instance))
  end

  test "should show report_instance" do
    get :show, id: @report_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @report_instance
    assert_response :success
  end

  test "should update report_instance" do
    patch :update, id: @report_instance, report_instance: { ACTION_TIME: @report_instance.ACTION_TIME, CHARACTER_NO: @report_instance.CHARACTER_NO, EXP: @report_instance.EXP, IP: @report_instance.IP, REPORT_NO: @report_instance.REPORT_NO, REPORT_TYPE: @report_instance.REPORT_TYPE, USER_LV: @report_instance.USER_LV, USER_NO: @report_instance.USER_NO, VALUE: @report_instance.VALUE }
    assert_redirected_to report_instance_path(assigns(:report_instance))
  end

  test "should destroy report_instance" do
    assert_difference('ReportInstance.count', -1) do
      delete :destroy, id: @report_instance
    end

    assert_redirected_to report_instances_path
  end
end
