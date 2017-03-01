require 'test_helper'

class RegionInfosControllerTest < ActionController::TestCase
  setup do
    @region_info = region_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:region_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create region_info" do
    assert_difference('RegionInfo.count') do
      post :create, region_info: { CATEGORY: @region_info.CATEGORY, EXPLAIN: @region_info.EXPLAIN, HARD_STAGE: @region_info.HARD_STAGE, HELL_STAGE: @region_info.HELL_STAGE, IMAGE: @region_info.IMAGE, ITEM: @region_info.ITEM, LEVEL: @region_info.LEVEL, MONSTER: @region_info.MONSTER, NAME: @region_info.NAME, NORMAL_STAGE: @region_info.NORMAL_STAGE, OPEN: @region_info.OPEN, REGION_ID: @region_info.REGION_ID, SCENARIO_END: @region_info.SCENARIO_END, SCENARIO_START: @region_info.SCENARIO_START }
    end

    assert_redirected_to region_info_path(assigns(:region_info))
  end

  test "should show region_info" do
    get :show, id: @region_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @region_info
    assert_response :success
  end

  test "should update region_info" do
    patch :update, id: @region_info, region_info: { CATEGORY: @region_info.CATEGORY, EXPLAIN: @region_info.EXPLAIN, HARD_STAGE: @region_info.HARD_STAGE, HELL_STAGE: @region_info.HELL_STAGE, IMAGE: @region_info.IMAGE, ITEM: @region_info.ITEM, LEVEL: @region_info.LEVEL, MONSTER: @region_info.MONSTER, NAME: @region_info.NAME, NORMAL_STAGE: @region_info.NORMAL_STAGE, OPEN: @region_info.OPEN, REGION_ID: @region_info.REGION_ID, SCENARIO_END: @region_info.SCENARIO_END, SCENARIO_START: @region_info.SCENARIO_START }
    assert_redirected_to region_info_path(assigns(:region_info))
  end

  test "should destroy region_info" do
    assert_difference('RegionInfo.count', -1) do
      delete :destroy, id: @region_info
    end

    assert_redirected_to region_infos_path
  end
end
