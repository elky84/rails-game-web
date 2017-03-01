require 'test_helper'

class PvpSuccessionBonusInfosControllerTest < ActionController::TestCase
  setup do
    @pvp_succession_bonus_info = pvp_succession_bonus_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pvp_succession_bonus_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pvp_succession_bonus_info" do
    assert_difference('PvpSuccessionBonusInfo.count') do
      post :create, pvp_succession_bonus_info: { BONUS_POINT: @pvp_succession_bonus_info.BONUS_POINT, PVP_SUCCESSION_BONUS_ID: @pvp_succession_bonus_info.PVP_SUCCESSION_BONUS_ID }
    end

    assert_redirected_to pvp_succession_bonus_info_path(assigns(:pvp_succession_bonus_info))
  end

  test "should show pvp_succession_bonus_info" do
    get :show, id: @pvp_succession_bonus_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pvp_succession_bonus_info
    assert_response :success
  end

  test "should update pvp_succession_bonus_info" do
    patch :update, id: @pvp_succession_bonus_info, pvp_succession_bonus_info: { BONUS_POINT: @pvp_succession_bonus_info.BONUS_POINT, PVP_SUCCESSION_BONUS_ID: @pvp_succession_bonus_info.PVP_SUCCESSION_BONUS_ID }
    assert_redirected_to pvp_succession_bonus_info_path(assigns(:pvp_succession_bonus_info))
  end

  test "should destroy pvp_succession_bonus_info" do
    assert_difference('PvpSuccessionBonusInfo.count', -1) do
      delete :destroy, id: @pvp_succession_bonus_info
    end

    assert_redirected_to pvp_succession_bonus_infos_path
  end
end
