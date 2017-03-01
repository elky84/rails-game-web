require 'test_helper'

class StageInfosControllerTest < ActionController::TestCase
  setup do
    @stage_info = stage_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stage_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stage_info" do
    assert_difference('StageInfo.count') do
      post :create, stage_info: { AREA_ID: @stage_info.AREA_ID, BGM: @stage_info.BGM, BG_COLOR: @stage_info.BG_COLOR, BG_PREFEB: @stage_info.BG_PREFEB, CHARACTER_LEVEL: @stage_info.CHARACTER_LEVEL, CLEAR_1_REWARD: @stage_info.CLEAR_1_REWARD, CLEAR_1_REWARD_PROBABILITY: @stage_info.CLEAR_1_REWARD_PROBABILITY, CLEAR_2_REWARD: @stage_info.CLEAR_2_REWARD, CLEAR_2_REWARD_PROBABILITY: @stage_info.CLEAR_2_REWARD_PROBABILITY, CLEAR_3_REWARD: @stage_info.CLEAR_3_REWARD, CLEAR_3_REWARD_PROBABILITY: @stage_info.CLEAR_3_REWARD_PROBABILITY, CLEAR_EXP: @stage_info.CLEAR_EXP, CLEAR_MONEY: @stage_info.CLEAR_MONEY, CLEAR_SCORE: @stage_info.CLEAR_SCORE, COORDINATE: @stage_info.COORDINATE, END_SCENARIO: @stage_info.END_SCENARIO, EXPLAIN: @stage_info.EXPLAIN, INFI_TOWER_PREVIEW: @stage_info.INFI_TOWER_PREVIEW, INFI_TOWER_SP_REWARD: @stage_info.INFI_TOWER_SP_REWARD, ITEM: @stage_info.ITEM, LEVEL: @stage_info.LEVEL, MONSTER: @stage_info.MONSTER, NAME: @stage_info.NAME, OPEN: @stage_info.OPEN, PHASE: @stage_info.PHASE, STAGE_ICON: @stage_info.STAGE_ICON, STAGE_ID: @stage_info.STAGE_ID, STAGE_NUMBER: @stage_info.STAGE_NUMBER, STAMINA: @stage_info.STAMINA, START_SCENARIO: @stage_info.START_SCENARIO, TYPE: @stage_info.TYPE }
    end

    assert_redirected_to stage_info_path(assigns(:stage_info))
  end

  test "should show stage_info" do
    get :show, id: @stage_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stage_info
    assert_response :success
  end

  test "should update stage_info" do
    patch :update, id: @stage_info, stage_info: { AREA_ID: @stage_info.AREA_ID, BGM: @stage_info.BGM, BG_COLOR: @stage_info.BG_COLOR, BG_PREFEB: @stage_info.BG_PREFEB, CHARACTER_LEVEL: @stage_info.CHARACTER_LEVEL, CLEAR_1_REWARD: @stage_info.CLEAR_1_REWARD, CLEAR_1_REWARD_PROBABILITY: @stage_info.CLEAR_1_REWARD_PROBABILITY, CLEAR_2_REWARD: @stage_info.CLEAR_2_REWARD, CLEAR_2_REWARD_PROBABILITY: @stage_info.CLEAR_2_REWARD_PROBABILITY, CLEAR_3_REWARD: @stage_info.CLEAR_3_REWARD, CLEAR_3_REWARD_PROBABILITY: @stage_info.CLEAR_3_REWARD_PROBABILITY, CLEAR_EXP: @stage_info.CLEAR_EXP, CLEAR_MONEY: @stage_info.CLEAR_MONEY, CLEAR_SCORE: @stage_info.CLEAR_SCORE, COORDINATE: @stage_info.COORDINATE, END_SCENARIO: @stage_info.END_SCENARIO, EXPLAIN: @stage_info.EXPLAIN, INFI_TOWER_PREVIEW: @stage_info.INFI_TOWER_PREVIEW, INFI_TOWER_SP_REWARD: @stage_info.INFI_TOWER_SP_REWARD, ITEM: @stage_info.ITEM, LEVEL: @stage_info.LEVEL, MONSTER: @stage_info.MONSTER, NAME: @stage_info.NAME, OPEN: @stage_info.OPEN, PHASE: @stage_info.PHASE, STAGE_ICON: @stage_info.STAGE_ICON, STAGE_ID: @stage_info.STAGE_ID, STAGE_NUMBER: @stage_info.STAGE_NUMBER, STAMINA: @stage_info.STAMINA, START_SCENARIO: @stage_info.START_SCENARIO, TYPE: @stage_info.TYPE }
    assert_redirected_to stage_info_path(assigns(:stage_info))
  end

  test "should destroy stage_info" do
    assert_difference('StageInfo.count', -1) do
      delete :destroy, id: @stage_info
    end

    assert_redirected_to stage_infos_path
  end
end
