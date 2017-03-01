require 'test_helper'

class PvpRewardInfosControllerTest < ActionController::TestCase
  setup do
    @pvp_reward_info = pvp_reward_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pvp_reward_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pvp_reward_info" do
    assert_difference('PvpRewardInfo.count') do
      post :create, pvp_reward_info: { MAX: @pvp_reward_info.MAX, MIN: @pvp_reward_info.MIN, PVP_REWARD_ID: @pvp_reward_info.PVP_REWARD_ID, RANGE_TYPE: @pvp_reward_info.RANGE_TYPE, REWARD_TYPE_AND_CAPACITY: @pvp_reward_info.REWARD_TYPE_AND_CAPACITY }
    end

    assert_redirected_to pvp_reward_info_path(assigns(:pvp_reward_info))
  end

  test "should show pvp_reward_info" do
    get :show, id: @pvp_reward_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pvp_reward_info
    assert_response :success
  end

  test "should update pvp_reward_info" do
    patch :update, id: @pvp_reward_info, pvp_reward_info: { MAX: @pvp_reward_info.MAX, MIN: @pvp_reward_info.MIN, PVP_REWARD_ID: @pvp_reward_info.PVP_REWARD_ID, RANGE_TYPE: @pvp_reward_info.RANGE_TYPE, REWARD_TYPE_AND_CAPACITY: @pvp_reward_info.REWARD_TYPE_AND_CAPACITY }
    assert_redirected_to pvp_reward_info_path(assigns(:pvp_reward_info))
  end

  test "should destroy pvp_reward_info" do
    assert_difference('PvpRewardInfo.count', -1) do
      delete :destroy, id: @pvp_reward_info
    end

    assert_redirected_to pvp_reward_infos_path
  end
end
