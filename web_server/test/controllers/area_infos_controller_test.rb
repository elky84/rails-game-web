require 'test_helper'

class AreaInfosControllerTest < ActionController::TestCase
  setup do
    @area_info = area_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:area_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create area_info" do
    assert_difference('AreaInfo.count') do
      post :create, area_info: { AREA_ID: @area_info.AREA_ID, AREA_TYPE: @area_info.AREA_TYPE, BG_COLOR: @area_info.BG_COLOR, CHARACTER_LEVEL: @area_info.CHARACTER_LEVEL, END_DATE: @area_info.END_DATE, EXPLAIN: @area_info.EXPLAIN, IMAGE: @area_info.IMAGE, ITEM: @area_info.ITEM, MISSION: @area_info.MISSION, MONSTER: @area_info.MONSTER, NAME: @area_info.NAME, OPEN: @area_info.OPEN, SCENARIO_END: @area_info.SCENARIO_END, SCENARIO_START: @area_info.SCENARIO_START, START_DATE: @area_info.START_DATE }
    end

    assert_redirected_to area_info_path(assigns(:area_info))
  end

  test "should show area_info" do
    get :show, id: @area_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @area_info
    assert_response :success
  end

  test "should update area_info" do
    patch :update, id: @area_info, area_info: { AREA_ID: @area_info.AREA_ID, AREA_TYPE: @area_info.AREA_TYPE, BG_COLOR: @area_info.BG_COLOR, CHARACTER_LEVEL: @area_info.CHARACTER_LEVEL, END_DATE: @area_info.END_DATE, EXPLAIN: @area_info.EXPLAIN, IMAGE: @area_info.IMAGE, ITEM: @area_info.ITEM, MISSION: @area_info.MISSION, MONSTER: @area_info.MONSTER, NAME: @area_info.NAME, OPEN: @area_info.OPEN, SCENARIO_END: @area_info.SCENARIO_END, SCENARIO_START: @area_info.SCENARIO_START, START_DATE: @area_info.START_DATE }
    assert_redirected_to area_info_path(assigns(:area_info))
  end

  test "should destroy area_info" do
    assert_difference('AreaInfo.count', -1) do
      delete :destroy, id: @area_info
    end

    assert_redirected_to area_infos_path
  end
end
