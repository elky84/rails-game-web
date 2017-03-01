require 'test_helper'

class ItemEnchantsControllerTest < ActionController::TestCase
  setup do
    @item_enchant = item_enchants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_enchants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_enchant" do
    assert_difference('ItemEnchant.count') do
      post :create, item_enchant: { ENCHANT: @item_enchant.ENCHANT, ENCHANT_PROBABILITY: @item_enchant.ENCHANT_PROBABILITY, GRADE: @item_enchant.GRADE, ITEM_CATEGORY: @item_enchant.ITEM_CATEGORY, ITEM_ENCHANT_ID: @item_enchant.ITEM_ENCHANT_ID, LEVEL: @item_enchant.LEVEL, MONEY: @item_enchant.MONEY }
    end

    assert_redirected_to item_enchant_path(assigns(:item_enchant))
  end

  test "should show item_enchant" do
    get :show, id: @item_enchant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_enchant
    assert_response :success
  end

  test "should update item_enchant" do
    patch :update, id: @item_enchant, item_enchant: { ENCHANT: @item_enchant.ENCHANT, ENCHANT_PROBABILITY: @item_enchant.ENCHANT_PROBABILITY, GRADE: @item_enchant.GRADE, ITEM_CATEGORY: @item_enchant.ITEM_CATEGORY, ITEM_ENCHANT_ID: @item_enchant.ITEM_ENCHANT_ID, LEVEL: @item_enchant.LEVEL, MONEY: @item_enchant.MONEY }
    assert_redirected_to item_enchant_path(assigns(:item_enchant))
  end

  test "should destroy item_enchant" do
    assert_difference('ItemEnchant.count', -1) do
      delete :destroy, id: @item_enchant
    end

    assert_redirected_to item_enchants_path
  end
end
