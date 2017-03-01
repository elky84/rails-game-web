require 'test_helper'

class CharacterGrowsControllerTest < ActionController::TestCase
  setup do
    @character_grow = character_grows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:character_grows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create character_grow" do
    assert_difference('CharacterGrow.count') do
      post :create, character_grow: { GROW_ID: @character_grow.GROW_ID, GROW_TYPE_DETAIL: @character_grow.GROW_TYPE_DETAIL, LEVEL: @character_grow.LEVEL, REQUIRE_EXP: @character_grow.REQUIRE_EXP, STATUS_ID: @character_grow.STATUS_ID }
    end

    assert_redirected_to character_grow_path(assigns(:character_grow))
  end

  test "should show character_grow" do
    get :show, id: @character_grow
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @character_grow
    assert_response :success
  end

  test "should update character_grow" do
    patch :update, id: @character_grow, character_grow: { GROW_ID: @character_grow.GROW_ID, GROW_TYPE_DETAIL: @character_grow.GROW_TYPE_DETAIL, LEVEL: @character_grow.LEVEL, REQUIRE_EXP: @character_grow.REQUIRE_EXP, STATUS_ID: @character_grow.STATUS_ID }
    assert_redirected_to character_grow_path(assigns(:character_grow))
  end

  test "should destroy character_grow" do
    assert_difference('CharacterGrow.count', -1) do
      delete :destroy, id: @character_grow
    end

    assert_redirected_to character_grows_path
  end
end
