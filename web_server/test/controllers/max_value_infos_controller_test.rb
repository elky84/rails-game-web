require 'test_helper'

class MaxValueInfosControllerTest < ActionController::TestCase
  setup do
    @max_value_info = max_value_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:max_value_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create max_value_info" do
    assert_difference('MaxValueInfo.count') do
      post :create, max_value_info: { EXT_SLOT: @max_value_info.EXT_SLOT, MAX_SLOT_TYPE: @max_value_info.MAX_SLOT_TYPE, MAX_VALUE_ID: @max_value_info.MAX_VALUE_ID, NEXT_COST: @max_value_info.NEXT_COST, NEXT_EXT_SLOT: @max_value_info.NEXT_EXT_SLOT }
    end

    assert_redirected_to max_value_info_path(assigns(:max_value_info))
  end

  test "should show max_value_info" do
    get :show, id: @max_value_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @max_value_info
    assert_response :success
  end

  test "should update max_value_info" do
    patch :update, id: @max_value_info, max_value_info: { EXT_SLOT: @max_value_info.EXT_SLOT, MAX_SLOT_TYPE: @max_value_info.MAX_SLOT_TYPE, MAX_VALUE_ID: @max_value_info.MAX_VALUE_ID, NEXT_COST: @max_value_info.NEXT_COST, NEXT_EXT_SLOT: @max_value_info.NEXT_EXT_SLOT }
    assert_redirected_to max_value_info_path(assigns(:max_value_info))
  end

  test "should destroy max_value_info" do
    assert_difference('MaxValueInfo.count', -1) do
      delete :destroy, id: @max_value_info
    end

    assert_redirected_to max_value_infos_path
  end
end
