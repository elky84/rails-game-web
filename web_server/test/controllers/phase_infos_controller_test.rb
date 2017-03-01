require 'test_helper'

class PhaseInfosControllerTest < ActionController::TestCase
  setup do
    @phase_info = phase_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phase_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create phase_info" do
    assert_difference('PhaseInfo.count') do
      post :create, phase_info: { APPEAR_SPEED: @phase_info.APPEAR_SPEED, APPEAR_TIME: @phase_info.APPEAR_TIME, CLEAR: @phase_info.CLEAR, END_SCENARIO: @phase_info.END_SCENARIO, INIT_POS: @phase_info.INIT_POS, IS_BOSS_PHASE: @phase_info.IS_BOSS_PHASE, MONSTER: @phase_info.MONSTER, MONSTER_GEN_INFO: @phase_info.MONSTER_GEN_INFO, MONSTER_LV: @phase_info.MONSTER_LV, MOVE_TIME: @phase_info.MOVE_TIME, PHASE_ID: @phase_info.PHASE_ID, PHASE_WIDTH: @phase_info.PHASE_WIDTH, START_SCENARIO: @phase_info.START_SCENARIO, STAY_TIME: @phase_info.STAY_TIME, TEAM_INDEX: @phase_info.TEAM_INDEX, WAIT_TIME: @phase_info.WAIT_TIME }
    end

    assert_redirected_to phase_info_path(assigns(:phase_info))
  end

  test "should show phase_info" do
    get :show, id: @phase_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @phase_info
    assert_response :success
  end

  test "should update phase_info" do
    patch :update, id: @phase_info, phase_info: { APPEAR_SPEED: @phase_info.APPEAR_SPEED, APPEAR_TIME: @phase_info.APPEAR_TIME, CLEAR: @phase_info.CLEAR, END_SCENARIO: @phase_info.END_SCENARIO, INIT_POS: @phase_info.INIT_POS, IS_BOSS_PHASE: @phase_info.IS_BOSS_PHASE, MONSTER: @phase_info.MONSTER, MONSTER_GEN_INFO: @phase_info.MONSTER_GEN_INFO, MONSTER_LV: @phase_info.MONSTER_LV, MOVE_TIME: @phase_info.MOVE_TIME, PHASE_ID: @phase_info.PHASE_ID, PHASE_WIDTH: @phase_info.PHASE_WIDTH, START_SCENARIO: @phase_info.START_SCENARIO, STAY_TIME: @phase_info.STAY_TIME, TEAM_INDEX: @phase_info.TEAM_INDEX, WAIT_TIME: @phase_info.WAIT_TIME }
    assert_redirected_to phase_info_path(assigns(:phase_info))
  end

  test "should destroy phase_info" do
    assert_difference('PhaseInfo.count', -1) do
      delete :destroy, id: @phase_info
    end

    assert_redirected_to phase_infos_path
  end
end
