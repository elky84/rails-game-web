require 'test_helper'

class PvpPeriodsControllerTest < ActionController::TestCase
  setup do
    @pvp_period = pvp_periods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pvp_periods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pvp_period" do
    assert_difference('PvpPeriod.count') do
      post :create, pvp_period: { END_DATE: @pvp_period.END_DATE, PVP_PERIOD_ID: @pvp_period.PVP_PERIOD_ID, SEASON_NUM: @pvp_period.SEASON_NUM, START_DATE: @pvp_period.START_DATE }
    end

    assert_redirected_to pvp_period_path(assigns(:pvp_period))
  end

  test "should show pvp_period" do
    get :show, id: @pvp_period
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pvp_period
    assert_response :success
  end

  test "should update pvp_period" do
    patch :update, id: @pvp_period, pvp_period: { END_DATE: @pvp_period.END_DATE, PVP_PERIOD_ID: @pvp_period.PVP_PERIOD_ID, SEASON_NUM: @pvp_period.SEASON_NUM, START_DATE: @pvp_period.START_DATE }
    assert_redirected_to pvp_period_path(assigns(:pvp_period))
  end

  test "should destroy pvp_period" do
    assert_difference('PvpPeriod.count', -1) do
      delete :destroy, id: @pvp_period
    end

    assert_redirected_to pvp_periods_path
  end
end
