require 'test_helper'

class UserGrowsControllerTest < ActionController::TestCase
  setup do
    @user_grow = user_grows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_grows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_grow" do
    assert_difference('UserGrow.count') do
      post :create, user_grow: { GROW_ID: @user_grow.GROW_ID, LEVEL: @user_grow.LEVEL, REQUIRE_EXP: @user_grow.REQUIRE_EXP }
    end

    assert_redirected_to user_grow_path(assigns(:user_grow))
  end

  test "should show user_grow" do
    get :show, id: @user_grow
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_grow
    assert_response :success
  end

  test "should update user_grow" do
    patch :update, id: @user_grow, user_grow: { GROW_ID: @user_grow.GROW_ID, LEVEL: @user_grow.LEVEL, REQUIRE_EXP: @user_grow.REQUIRE_EXP }
    assert_redirected_to user_grow_path(assigns(:user_grow))
  end

  test "should destroy user_grow" do
    assert_difference('UserGrow.count', -1) do
      delete :destroy, id: @user_grow
    end

    assert_redirected_to user_grows_path
  end
end
