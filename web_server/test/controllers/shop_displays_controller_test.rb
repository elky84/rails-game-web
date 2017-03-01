require 'test_helper'

class ShopDisplaysControllerTest < ActionController::TestCase
  setup do
    @shop_display = shop_displays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shop_displays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shop_display" do
    assert_difference('ShopDisplay.count') do
      post :create, shop_display: { SHOP_CATEGORY: @shop_display.SHOP_CATEGORY, SHOP_ITEM_ID: @shop_display.SHOP_ITEM_ID, SHOP_MENU_ID: @shop_display.SHOP_MENU_ID }
    end

    assert_redirected_to shop_display_path(assigns(:shop_display))
  end

  test "should show shop_display" do
    get :show, id: @shop_display
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shop_display
    assert_response :success
  end

  test "should update shop_display" do
    patch :update, id: @shop_display, shop_display: { SHOP_CATEGORY: @shop_display.SHOP_CATEGORY, SHOP_ITEM_ID: @shop_display.SHOP_ITEM_ID, SHOP_MENU_ID: @shop_display.SHOP_MENU_ID }
    assert_redirected_to shop_display_path(assigns(:shop_display))
  end

  test "should destroy shop_display" do
    assert_difference('ShopDisplay.count', -1) do
      delete :destroy, id: @shop_display
    end

    assert_redirected_to shop_displays_path
  end
end
