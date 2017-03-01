require 'test_helper'

class PvpInstancesControllerTest < ActionController::TestCase
  setup do
    @pvp_instance = pvp_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pvp_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pvp_instance" do
    assert_difference('PvpInstance.count') do
      post :create, pvp_instance: { ATTACKER_POWER: @pvp_instance.ATTACKER_POWER, CHARACTER_ID: @pvp_instance.CHARACTER_ID, CHARACTER_LV: @pvp_instance.CHARACTER_LV, CHARACTER_NO: @pvp_instance.CHARACTER_NO, COSTUME_ID: @pvp_instance.COSTUME_ID, CUR_MATCH_NO: @pvp_instance.CUR_MATCH_NO, DEFEAT_COUNT: @pvp_instance.DEFEAT_COUNT, DEFENDER_POWER: @pvp_instance.DEFENDER_POWER, IS_SUCCESSION_VICTORY: @pvp_instance.IS_SUCCESSION_VICTORY, PARTY_ATTACKER: @pvp_instance.PARTY_ATTACKER, PARTY_DEFENDER: @pvp_instance.PARTY_DEFENDER, RANK: @pvp_instance.RANK, RATING: @pvp_instance.RATING, SEASON_NUM: @pvp_instance.SEASON_NUM, SUCCESSION_COUNT: @pvp_instance.SUCCESSION_COUNT, USER_LV: @pvp_instance.USER_LV, USER_NICKNAME: @pvp_instance.USER_NICKNAME, USER_NO: @pvp_instance.USER_NO, VICTORY_COUNT: @pvp_instance.VICTORY_COUNT }
    end

    assert_redirected_to pvp_instance_path(assigns(:pvp_instance))
  end

  test "should show pvp_instance" do
    get :show, id: @pvp_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pvp_instance
    assert_response :success
  end

  test "should update pvp_instance" do
    patch :update, id: @pvp_instance, pvp_instance: { ATTACKER_POWER: @pvp_instance.ATTACKER_POWER, CHARACTER_ID: @pvp_instance.CHARACTER_ID, CHARACTER_LV: @pvp_instance.CHARACTER_LV, CHARACTER_NO: @pvp_instance.CHARACTER_NO, COSTUME_ID: @pvp_instance.COSTUME_ID, CUR_MATCH_NO: @pvp_instance.CUR_MATCH_NO, DEFEAT_COUNT: @pvp_instance.DEFEAT_COUNT, DEFENDER_POWER: @pvp_instance.DEFENDER_POWER, IS_SUCCESSION_VICTORY: @pvp_instance.IS_SUCCESSION_VICTORY, PARTY_ATTACKER: @pvp_instance.PARTY_ATTACKER, PARTY_DEFENDER: @pvp_instance.PARTY_DEFENDER, RANK: @pvp_instance.RANK, RATING: @pvp_instance.RATING, SEASON_NUM: @pvp_instance.SEASON_NUM, SUCCESSION_COUNT: @pvp_instance.SUCCESSION_COUNT, USER_LV: @pvp_instance.USER_LV, USER_NICKNAME: @pvp_instance.USER_NICKNAME, USER_NO: @pvp_instance.USER_NO, VICTORY_COUNT: @pvp_instance.VICTORY_COUNT }
    assert_redirected_to pvp_instance_path(assigns(:pvp_instance))
  end

  test "should destroy pvp_instance" do
    assert_difference('PvpInstance.count', -1) do
      delete :destroy, id: @pvp_instance
    end

    assert_redirected_to pvp_instances_path
  end
end
