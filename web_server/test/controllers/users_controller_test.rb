require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { CASH: @user.CASH, EXT_FRIEND_COUNT: @user.EXT_FRIEND_COUNT, EXT_ITEM_SLOT: @user.EXT_ITEM_SLOT, EXT_MONSTER_SLOT: @user.EXT_MONSTER_SLOT, FRIEND_POINT: @user.FRIEND_POINT, LASTEST_ACTIVE_TIME: @user.LASTEST_ACTIVE_TIME, MONEY: @user.MONEY, NICKNAME: @user.NICKNAME, POSTBOX_SLOT: @user.POSTBOX_SLOT, STAMINA: @user.STAMINA, STAMINA_TIME: @user.STAMINA_TIME, USER_ID: @user.USER_ID, USER_NO: @user.USER_NO }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { CASH: @user.CASH, EXT_FRIEND_COUNT: @user.EXT_FRIEND_COUNT, EXT_ITEM_SLOT: @user.EXT_ITEM_SLOT, EXT_MONSTER_SLOT: @user.EXT_MONSTER_SLOT, FRIEND_POINT: @user.FRIEND_POINT, LASTEST_ACTIVE_TIME: @user.LASTEST_ACTIVE_TIME, MONEY: @user.MONEY, NICKNAME: @user.NICKNAME, POSTBOX_SLOT: @user.POSTBOX_SLOT, STAMINA: @user.STAMINA, STAMINA_TIME: @user.STAMINA_TIME, USER_ID: @user.USER_ID, USER_NO: @user.USER_NO }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
