require 'test_helper'

class ShopItemsControllerTest < ActionController::TestCase
  setup do
    @shop_item = shop_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shop_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shop_item" do
    assert_difference('ShopItem.count') do
      post :create, shop_item: { BONUS_ID: @shop_item.BONUS_ID, BONUS_STRING: @shop_item.BONUS_STRING, CAPACITY: @shop_item.CAPACITY, CHARACTER_LEVEL: @shop_item.CHARACTER_LEVEL, END_DATE: @shop_item.END_DATE, EXPLAIN: @shop_item.EXPLAIN, GACHA: @shop_item.GACHA, GIFT: @shop_item.GIFT, HIDE: @shop_item.HIDE, ICON: @shop_item.ICON, ITEM_ID: @shop_item.ITEM_ID, NAME: @shop_item.NAME, NSTORE_PID: @shop_item.NSTORE_PID, PLAY_PID: @shop_item.PLAY_PID, PRICE: @shop_item.PRICE, PRICE_TYPE: @shop_item.PRICE_TYPE, SHOP_CATEGORY: @shop_item.SHOP_CATEGORY, SHOP_ITEM_ID: @shop_item.SHOP_ITEM_ID, START_DATE: @shop_item.START_DATE, STORE: @shop_item.STORE }
    end

    assert_redirected_to shop_item_path(assigns(:shop_item))
  end

  test "should show shop_item" do
    get :show, id: @shop_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shop_item
    assert_response :success
  end

  test "should update shop_item" do
    patch :update, id: @shop_item, shop_item: { BONUS_ID: @shop_item.BONUS_ID, BONUS_STRING: @shop_item.BONUS_STRING, CAPACITY: @shop_item.CAPACITY, CHARACTER_LEVEL: @shop_item.CHARACTER_LEVEL, END_DATE: @shop_item.END_DATE, EXPLAIN: @shop_item.EXPLAIN, GACHA: @shop_item.GACHA, GIFT: @shop_item.GIFT, HIDE: @shop_item.HIDE, ICON: @shop_item.ICON, ITEM_ID: @shop_item.ITEM_ID, NAME: @shop_item.NAME, NSTORE_PID: @shop_item.NSTORE_PID, PLAY_PID: @shop_item.PLAY_PID, PRICE: @shop_item.PRICE, PRICE_TYPE: @shop_item.PRICE_TYPE, SHOP_CATEGORY: @shop_item.SHOP_CATEGORY, SHOP_ITEM_ID: @shop_item.SHOP_ITEM_ID, START_DATE: @shop_item.START_DATE, STORE: @shop_item.STORE }
    assert_redirected_to shop_item_path(assigns(:shop_item))
  end

  test "should destroy shop_item" do
    assert_difference('ShopItem.count', -1) do
      delete :destroy, id: @shop_item
    end

    assert_redirected_to shop_items_path
  end
end
