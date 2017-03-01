require 'test_helper'

class GachaGroupsControllerTest < ActionController::TestCase
  setup do
    @gacha_group = gacha_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gacha_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gacha_group" do
    assert_difference('GachaGroup.count') do
      post :create, gacha_group: { DESCRIPTION: @gacha_group.DESCRIPTION, GACHA_GROUP_ID: @gacha_group.GACHA_GROUP_ID, GROUP_REWARD: @gacha_group.GROUP_REWARD }
    end

    assert_redirected_to gacha_group_path(assigns(:gacha_group))
  end

  test "should show gacha_group" do
    get :show, id: @gacha_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gacha_group
    assert_response :success
  end

  test "should update gacha_group" do
    patch :update, id: @gacha_group, gacha_group: { DESCRIPTION: @gacha_group.DESCRIPTION, GACHA_GROUP_ID: @gacha_group.GACHA_GROUP_ID, GROUP_REWARD: @gacha_group.GROUP_REWARD }
    assert_redirected_to gacha_group_path(assigns(:gacha_group))
  end

  test "should destroy gacha_group" do
    assert_difference('GachaGroup.count', -1) do
      delete :destroy, id: @gacha_group
    end

    assert_redirected_to gacha_groups_path
  end
end
