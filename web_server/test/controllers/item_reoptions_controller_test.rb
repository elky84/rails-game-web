require 'test_helper'

class ItemReoptionsControllerTest < ActionController::TestCase
  setup do
    @item_reoption = item_reoptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_reoptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_reoption" do
    assert_difference('ItemReoption.count') do
      post :create, item_reoption: { GRADE: @item_reoption.GRADE, ITEM_CATEGORY: @item_reoption.ITEM_CATEGORY, ITEM_REOPTION_ID: @item_reoption.ITEM_REOPTION_ID, LEVEL: @item_reoption.LEVEL, MONEY: @item_reoption.MONEY }
    end

    assert_redirected_to item_reoption_path(assigns(:item_reoption))
  end

  test "should show item_reoption" do
    get :show, id: @item_reoption
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_reoption
    assert_response :success
  end

  test "should update item_reoption" do
    patch :update, id: @item_reoption, item_reoption: { GRADE: @item_reoption.GRADE, ITEM_CATEGORY: @item_reoption.ITEM_CATEGORY, ITEM_REOPTION_ID: @item_reoption.ITEM_REOPTION_ID, LEVEL: @item_reoption.LEVEL, MONEY: @item_reoption.MONEY }
    assert_redirected_to item_reoption_path(assigns(:item_reoption))
  end

  test "should destroy item_reoption" do
    assert_difference('ItemReoption.count', -1) do
      delete :destroy, id: @item_reoption
    end

    assert_redirected_to item_reoptions_path
  end
end
