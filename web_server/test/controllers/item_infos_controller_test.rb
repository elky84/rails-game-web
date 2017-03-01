require 'test_helper'

class ItemInfosControllerTest < ActionController::TestCase
  setup do
    @item_info = item_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_info" do
    assert_difference('ItemInfo.count') do
      post :create, item_info: { CATEGORY: @item_info.CATEGORY, COSTUME_ID: @item_info.COSTUME_ID, DEFAULT_OPTION: @item_info.DEFAULT_OPTION, DURABILITY: @item_info.DURABILITY, EXPIRE_TYPE: @item_info.EXPIRE_TYPE, EXPLAIN: @item_info.EXPLAIN, GRADE: @item_info.GRADE, ICON: @item_info.ICON, IS_ENCHANT: @item_info.IS_ENCHANT, IS_REOPTION: @item_info.IS_REOPTION, IS_SELL: @item_info.IS_SELL, ITEM_ID: @item_info.ITEM_ID, ITEM_OPTION_LIST: @item_info.ITEM_OPTION_LIST, LEVEL: @item_info.LEVEL, LIMIT: @item_info.LIMIT, NAME: @item_info.NAME, PRICE: @item_info.PRICE, VALUE: @item_info.VALUE }
    end

    assert_redirected_to item_info_path(assigns(:item_info))
  end

  test "should show item_info" do
    get :show, id: @item_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_info
    assert_response :success
  end

  test "should update item_info" do
    patch :update, id: @item_info, item_info: { CATEGORY: @item_info.CATEGORY, COSTUME_ID: @item_info.COSTUME_ID, DEFAULT_OPTION: @item_info.DEFAULT_OPTION, DURABILITY: @item_info.DURABILITY, EXPIRE_TYPE: @item_info.EXPIRE_TYPE, EXPLAIN: @item_info.EXPLAIN, GRADE: @item_info.GRADE, ICON: @item_info.ICON, IS_ENCHANT: @item_info.IS_ENCHANT, IS_REOPTION: @item_info.IS_REOPTION, IS_SELL: @item_info.IS_SELL, ITEM_ID: @item_info.ITEM_ID, ITEM_OPTION_LIST: @item_info.ITEM_OPTION_LIST, LEVEL: @item_info.LEVEL, LIMIT: @item_info.LIMIT, NAME: @item_info.NAME, PRICE: @item_info.PRICE, VALUE: @item_info.VALUE }
    assert_redirected_to item_info_path(assigns(:item_info))
  end

  test "should destroy item_info" do
    assert_difference('ItemInfo.count', -1) do
      delete :destroy, id: @item_info
    end

    assert_redirected_to item_infos_path
  end
end
