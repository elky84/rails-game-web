require 'test_helper'

class ItemStageDropsControllerTest < ActionController::TestCase
  setup do
    @item_stage_drop = item_stage_drops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_stage_drops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_stage_drop" do
    assert_difference('ItemStageDrop.count') do
      post :create, item_stage_drop: { ITEM_GENERATE_ID: @item_stage_drop.ITEM_GENERATE_ID, STAGE_ID: @item_stage_drop.STAGE_ID }
    end

    assert_redirected_to item_stage_drop_path(assigns(:item_stage_drop))
  end

  test "should show item_stage_drop" do
    get :show, id: @item_stage_drop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_stage_drop
    assert_response :success
  end

  test "should update item_stage_drop" do
    patch :update, id: @item_stage_drop, item_stage_drop: { ITEM_GENERATE_ID: @item_stage_drop.ITEM_GENERATE_ID, STAGE_ID: @item_stage_drop.STAGE_ID }
    assert_redirected_to item_stage_drop_path(assigns(:item_stage_drop))
  end

  test "should destroy item_stage_drop" do
    assert_difference('ItemStageDrop.count', -1) do
      delete :destroy, id: @item_stage_drop
    end

    assert_redirected_to item_stage_drops_path
  end
end
