require 'test_helper'

class NoticeInstancesControllerTest < ActionController::TestCase
  setup do
    @notice_instance = notice_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notice_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notice_instance" do
    assert_difference('NoticeInstance.count') do
      post :create, notice_instance: { CONTENT: @notice_instance.CONTENT, END_DATE: @notice_instance.END_DATE, NOTICE_NO: @notice_instance.NOTICE_NO, NOTICE_TYPE: @notice_instance.NOTICE_TYPE, START_DATE: @notice_instance.START_DATE }
    end

    assert_redirected_to notice_instance_path(assigns(:notice_instance))
  end

  test "should show notice_instance" do
    get :show, id: @notice_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notice_instance
    assert_response :success
  end

  test "should update notice_instance" do
    patch :update, id: @notice_instance, notice_instance: { CONTENT: @notice_instance.CONTENT, END_DATE: @notice_instance.END_DATE, NOTICE_NO: @notice_instance.NOTICE_NO, NOTICE_TYPE: @notice_instance.NOTICE_TYPE, START_DATE: @notice_instance.START_DATE }
    assert_redirected_to notice_instance_path(assigns(:notice_instance))
  end

  test "should destroy notice_instance" do
    assert_difference('NoticeInstance.count', -1) do
      delete :destroy, id: @notice_instance
    end

    assert_redirected_to notice_instances_path
  end
end
