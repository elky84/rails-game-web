require 'test_helper'

class MonsterGrowsControllerTest < ActionController::TestCase
  setup do
    @monster_grow = monster_grows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monster_grows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monster_grow" do
    assert_difference('MonsterGrow.count') do
      post :create, monster_grow: { GROW_ID: @monster_grow.GROW_ID, GROW_TYPE_DETAIL: @monster_grow.GROW_TYPE_DETAIL, LEVEL: @monster_grow.LEVEL, REQUIRE_EXP: @monster_grow.REQUIRE_EXP, STATUS_ID: @monster_grow.STATUS_ID }
    end

    assert_redirected_to monster_grow_path(assigns(:monster_grow))
  end

  test "should show monster_grow" do
    get :show, id: @monster_grow
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monster_grow
    assert_response :success
  end

  test "should update monster_grow" do
    patch :update, id: @monster_grow, monster_grow: { GROW_ID: @monster_grow.GROW_ID, GROW_TYPE_DETAIL: @monster_grow.GROW_TYPE_DETAIL, LEVEL: @monster_grow.LEVEL, REQUIRE_EXP: @monster_grow.REQUIRE_EXP, STATUS_ID: @monster_grow.STATUS_ID }
    assert_redirected_to monster_grow_path(assigns(:monster_grow))
  end

  test "should destroy monster_grow" do
    assert_difference('MonsterGrow.count', -1) do
      delete :destroy, id: @monster_grow
    end

    assert_redirected_to monster_grows_path
  end
end
