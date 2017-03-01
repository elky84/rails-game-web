require 'test_helper'

class PvpRankCacheInstancesControllerTest < ActionController::TestCase
  setup do
    @pvp_rank_cache_instance = pvp_rank_cache_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pvp_rank_cache_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pvp_rank_cache_instance" do
    assert_difference('PvpRankCacheInstance.count') do
      post :create, pvp_rank_cache_instance: { CHARACTER_NO: @pvp_rank_cache_instance.CHARACTER_NO, PVP_RANK_CACHE_INSTANCE_NO: @pvp_rank_cache_instance.PVP_RANK_CACHE_INSTANCE_NO, RANK: @pvp_rank_cache_instance.RANK, RATING: @pvp_rank_cache_instance.RATING }
    end

    assert_redirected_to pvp_rank_cache_instance_path(assigns(:pvp_rank_cache_instance))
  end

  test "should show pvp_rank_cache_instance" do
    get :show, id: @pvp_rank_cache_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pvp_rank_cache_instance
    assert_response :success
  end

  test "should update pvp_rank_cache_instance" do
    patch :update, id: @pvp_rank_cache_instance, pvp_rank_cache_instance: { CHARACTER_NO: @pvp_rank_cache_instance.CHARACTER_NO, PVP_RANK_CACHE_INSTANCE_NO: @pvp_rank_cache_instance.PVP_RANK_CACHE_INSTANCE_NO, RANK: @pvp_rank_cache_instance.RANK, RATING: @pvp_rank_cache_instance.RATING }
    assert_redirected_to pvp_rank_cache_instance_path(assigns(:pvp_rank_cache_instance))
  end

  test "should destroy pvp_rank_cache_instance" do
    assert_difference('PvpRankCacheInstance.count', -1) do
      delete :destroy, id: @pvp_rank_cache_instance
    end

    assert_redirected_to pvp_rank_cache_instances_path
  end
end
