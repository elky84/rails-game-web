require 'test_helper'

class PvpRecordInstancesControllerTest < ActionController::TestCase
  setup do
    @pvp_record_instance = pvp_record_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pvp_record_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pvp_record_instance" do
    assert_difference('PvpRecordInstance.count') do
      post :create, pvp_record_instance: { ADD_RATING: @pvp_record_instance.ADD_RATING, CHARACTER_NO: @pvp_record_instance.CHARACTER_NO, MATCH_CHARACTER_NO: @pvp_record_instance.MATCH_CHARACTER_NO, MATCH_CHR_DEF_POWER: @pvp_record_instance.MATCH_CHR_DEF_POWER, MATCH_CHR_ID: @pvp_record_instance.MATCH_CHR_ID, MATCH_CHR_LV: @pvp_record_instance.MATCH_CHR_LV, MATCH_MONSTER_ID: @pvp_record_instance.MATCH_MONSTER_ID, MATCH_MONSTER_LV: @pvp_record_instance.MATCH_MONSTER_LV, MATCH_USER_LV: @pvp_record_instance.MATCH_USER_LV, MATCH_USER_NICKNAME: @pvp_record_instance.MATCH_USER_NICKNAME, PVP_RECORD_INSTANCE_NO: @pvp_record_instance.PVP_RECORD_INSTANCE_NO, RESULT: @pvp_record_instance.RESULT, RESULT_RATING: @pvp_record_instance.RESULT_RATING, RESULT_TIME: @pvp_record_instance.RESULT_TIME, SEASON_NUM: @pvp_record_instance.SEASON_NUM }
    end

    assert_redirected_to pvp_record_instance_path(assigns(:pvp_record_instance))
  end

  test "should show pvp_record_instance" do
    get :show, id: @pvp_record_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pvp_record_instance
    assert_response :success
  end

  test "should update pvp_record_instance" do
    patch :update, id: @pvp_record_instance, pvp_record_instance: { ADD_RATING: @pvp_record_instance.ADD_RATING, CHARACTER_NO: @pvp_record_instance.CHARACTER_NO, MATCH_CHARACTER_NO: @pvp_record_instance.MATCH_CHARACTER_NO, MATCH_CHR_DEF_POWER: @pvp_record_instance.MATCH_CHR_DEF_POWER, MATCH_CHR_ID: @pvp_record_instance.MATCH_CHR_ID, MATCH_CHR_LV: @pvp_record_instance.MATCH_CHR_LV, MATCH_MONSTER_ID: @pvp_record_instance.MATCH_MONSTER_ID, MATCH_MONSTER_LV: @pvp_record_instance.MATCH_MONSTER_LV, MATCH_USER_LV: @pvp_record_instance.MATCH_USER_LV, MATCH_USER_NICKNAME: @pvp_record_instance.MATCH_USER_NICKNAME, PVP_RECORD_INSTANCE_NO: @pvp_record_instance.PVP_RECORD_INSTANCE_NO, RESULT: @pvp_record_instance.RESULT, RESULT_RATING: @pvp_record_instance.RESULT_RATING, RESULT_TIME: @pvp_record_instance.RESULT_TIME, SEASON_NUM: @pvp_record_instance.SEASON_NUM }
    assert_redirected_to pvp_record_instance_path(assigns(:pvp_record_instance))
  end

  test "should destroy pvp_record_instance" do
    assert_difference('PvpRecordInstance.count', -1) do
      delete :destroy, id: @pvp_record_instance
    end

    assert_redirected_to pvp_record_instances_path
  end
end
