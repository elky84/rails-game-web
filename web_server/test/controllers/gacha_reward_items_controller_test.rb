require 'test_helper'

class GachaRewardItemsControllerTest < ActionController::TestCase
  setup do
    @gacha_reward_item = gacha_reward_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gacha_reward_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gacha_reward_item" do
    assert_difference('GachaRewardItem.count') do
      post :create, gacha_reward_item: { GACHA_REWARD_ITEM_ID: @gacha_reward_item.GACHA_REWARD_ITEM_ID, ITEM_ID: @gacha_reward_item.ITEM_ID }
    end

    assert_redirected_to gacha_reward_item_path(assigns(:gacha_reward_item))
  end

  test "should show gacha_reward_item" do
    get :show, id: @gacha_reward_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gacha_reward_item
    assert_response :success
  end

  test "should update gacha_reward_item" do
    patch :update, id: @gacha_reward_item, gacha_reward_item: { GACHA_REWARD_ITEM_ID: @gacha_reward_item.GACHA_REWARD_ITEM_ID, ITEM_ID: @gacha_reward_item.ITEM_ID }
    assert_redirected_to gacha_reward_item_path(assigns(:gacha_reward_item))
  end

  test "should destroy gacha_reward_item" do
    assert_difference('GachaRewardItem.count', -1) do
      delete :destroy, id: @gacha_reward_item
    end

    assert_redirected_to gacha_reward_items_path
  end
end
