require 'test_helper'

class ItemOptionInfosControllerTest < ActionController::TestCase
  setup do
    @item_option_info = item_option_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_option_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_option_info" do
    assert_difference('ItemOptionInfo.count') do
      post :create, item_option_info: { CONDITION_ID: @item_option_info.CONDITION_ID, DESCRIPTION: @item_option_info.DESCRIPTION, ITEM_OPTION_INFO_ID: @item_option_info.ITEM_OPTION_INFO_ID, PARAMETER_ID: @item_option_info.PARAMETER_ID, UI_SCRIPT: @item_option_info.UI_SCRIPT }
    end

    assert_redirected_to item_option_info_path(assigns(:item_option_info))
  end

  test "should show item_option_info" do
    get :show, id: @item_option_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_option_info
    assert_response :success
  end

  test "should update item_option_info" do
    patch :update, id: @item_option_info, item_option_info: { CONDITION_ID: @item_option_info.CONDITION_ID, DESCRIPTION: @item_option_info.DESCRIPTION, ITEM_OPTION_INFO_ID: @item_option_info.ITEM_OPTION_INFO_ID, PARAMETER_ID: @item_option_info.PARAMETER_ID, UI_SCRIPT: @item_option_info.UI_SCRIPT }
    assert_redirected_to item_option_info_path(assigns(:item_option_info))
  end

  test "should destroy item_option_info" do
    assert_difference('ItemOptionInfo.count', -1) do
      delete :destroy, id: @item_option_info
    end

    assert_redirected_to item_option_infos_path
  end
end
