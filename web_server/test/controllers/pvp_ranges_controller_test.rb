require 'test_helper'

class PvpRangesControllerTest < ActionController::TestCase
  setup do
    @pvp_range = pvp_ranges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pvp_ranges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pvp_range" do
    assert_difference('PvpRange.count') do
      post :create, pvp_range: { ADD_RANK: @pvp_range.ADD_RANK, PVP_RANGE_ID: @pvp_range.PVP_RANGE_ID, RANK: @pvp_range.RANK, RATING: @pvp_range.RATING }
    end

    assert_redirected_to pvp_range_path(assigns(:pvp_range))
  end

  test "should show pvp_range" do
    get :show, id: @pvp_range
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pvp_range
    assert_response :success
  end

  test "should update pvp_range" do
    patch :update, id: @pvp_range, pvp_range: { ADD_RANK: @pvp_range.ADD_RANK, PVP_RANGE_ID: @pvp_range.PVP_RANGE_ID, RANK: @pvp_range.RANK, RATING: @pvp_range.RATING }
    assert_redirected_to pvp_range_path(assigns(:pvp_range))
  end

  test "should destroy pvp_range" do
    assert_difference('PvpRange.count', -1) do
      delete :destroy, id: @pvp_range
    end

    assert_redirected_to pvp_ranges_path
  end
end
