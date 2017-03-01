require 'test_helper'

class ItemOptionDetailsControllerTest < ActionController::TestCase
  setup do
    @item_option_detail = item_option_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_option_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_option_detail" do
    assert_difference('ItemOptionDetail.count') do
      post :create, item_option_detail: { CONDITION_ID: @item_option_detail.CONDITION_ID, ITEM_OPTION_DETAIL_ID: @item_option_detail.ITEM_OPTION_DETAIL_ID, OPTION_INFO: @item_option_detail.OPTION_INFO, PARAMETER_ID: @item_option_detail.PARAMETER_ID, UI_SCRIPT: @item_option_detail.UI_SCRIPT }
    end

    assert_redirected_to item_option_detail_path(assigns(:item_option_detail))
  end

  test "should show item_option_detail" do
    get :show, id: @item_option_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_option_detail
    assert_response :success
  end

  test "should update item_option_detail" do
    patch :update, id: @item_option_detail, item_option_detail: { CONDITION_ID: @item_option_detail.CONDITION_ID, ITEM_OPTION_DETAIL_ID: @item_option_detail.ITEM_OPTION_DETAIL_ID, OPTION_INFO: @item_option_detail.OPTION_INFO, PARAMETER_ID: @item_option_detail.PARAMETER_ID, UI_SCRIPT: @item_option_detail.UI_SCRIPT }
    assert_redirected_to item_option_detail_path(assigns(:item_option_detail))
  end

  test "should destroy item_option_detail" do
    assert_difference('ItemOptionDetail.count', -1) do
      delete :destroy, id: @item_option_detail
    end

    assert_redirected_to item_option_details_path
  end
end
