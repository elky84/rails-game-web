require 'test_helper'

class ItemOptionsControllerTest < ActionController::TestCase
  setup do
    @item_option = item_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_option" do
    assert_difference('ItemOption.count') do
      post :create, item_option: { DESCRIPTION: @item_option.DESCRIPTION, DETAIL_ID: @item_option.DETAIL_ID, GRADE: @item_option.GRADE, ITEM_OPTION_ID: @item_option.ITEM_OPTION_ID, MAX: @item_option.MAX, MIN: @item_option.MIN, OPTION_ID: @item_option.OPTION_ID }
    end

    assert_redirected_to item_option_path(assigns(:item_option))
  end

  test "should show item_option" do
    get :show, id: @item_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_option
    assert_response :success
  end

  test "should update item_option" do
    patch :update, id: @item_option, item_option: { DESCRIPTION: @item_option.DESCRIPTION, DETAIL_ID: @item_option.DETAIL_ID, GRADE: @item_option.GRADE, ITEM_OPTION_ID: @item_option.ITEM_OPTION_ID, MAX: @item_option.MAX, MIN: @item_option.MIN, OPTION_ID: @item_option.OPTION_ID }
    assert_redirected_to item_option_path(assigns(:item_option))
  end

  test "should destroy item_option" do
    assert_difference('ItemOption.count', -1) do
      delete :destroy, id: @item_option
    end

    assert_redirected_to item_options_path
  end
end
