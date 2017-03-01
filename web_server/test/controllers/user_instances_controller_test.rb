require 'test_helper'

class UserInstancesControllerTest < ActionController::TestCase
  setup do
    @user_instance = user_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_instance" do
    assert_difference('UserInstance.count') do
      post :create, user_instance: { CACHE_FRIEND_SLOT: @user_instance.CACHE_FRIEND_SLOT, CACHE_ITEM_SLOT: @user_instance.CACHE_ITEM_SLOT, CACHE_MONSTER_SLOT: @user_instance.CACHE_MONSTER_SLOT, CASH: @user_instance.CASH, EXP: @user_instance.EXP, EXT_FRIEND_COUNT: @user_instance.EXT_FRIEND_COUNT, EXT_ITEM_SLOT: @user_instance.EXT_ITEM_SLOT, EXT_MONSTER_SLOT: @user_instance.EXT_MONSTER_SLOT, FRIEND_DELETE_COUNT: @user_instance.FRIEND_DELETE_COUNT, FRIEND_POINT: @user_instance.FRIEND_POINT, INFI_TOWER_FLOOR: @user_instance.INFI_TOWER_FLOOR, LASTEST_ACTIVE_TIME: @user_instance.LASTEST_ACTIVE_TIME, LASTEST_CHR_ID: @user_instance.LASTEST_CHR_ID, LASTEST_CHR_LV: @user_instance.LASTEST_CHR_LV, MASTERY_POINT: @user_instance.MASTERY_POINT, MASTERY_RESET_COUNT: @user_instance.MASTERY_RESET_COUNT, MONEY: @user_instance.MONEY, NICKNAME: @user_instance.NICKNAME, PERMISSION: @user_instance.PERMISSION, POSTBOX_SLOT: @user_instance.POSTBOX_SLOT, STAMINA_ADVENTURE: @user_instance.STAMINA_ADVENTURE, STAMINA_ADVENTURE_TIME: @user_instance.STAMINA_ADVENTURE_TIME, STAMINA_PVP: @user_instance.STAMINA_PVP, STAMINA_PVP_TIME: @user_instance.STAMINA_PVP_TIME, STAMINA_SPECIAL: @user_instance.STAMINA_SPECIAL, STAMINA_SPECIAL_TIME: @user_instance.STAMINA_SPECIAL_TIME, USER_ID: @user_instance.USER_ID, USER_LV: @user_instance.USER_LV, USER_NO: @user_instance.USER_NO }
    end

    assert_redirected_to user_instance_path(assigns(:user_instance))
  end

  test "should show user_instance" do
    get :show, id: @user_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_instance
    assert_response :success
  end

  test "should update user_instance" do
    patch :update, id: @user_instance, user_instance: { CACHE_FRIEND_SLOT: @user_instance.CACHE_FRIEND_SLOT, CACHE_ITEM_SLOT: @user_instance.CACHE_ITEM_SLOT, CACHE_MONSTER_SLOT: @user_instance.CACHE_MONSTER_SLOT, CASH: @user_instance.CASH, EXP: @user_instance.EXP, EXT_FRIEND_COUNT: @user_instance.EXT_FRIEND_COUNT, EXT_ITEM_SLOT: @user_instance.EXT_ITEM_SLOT, EXT_MONSTER_SLOT: @user_instance.EXT_MONSTER_SLOT, FRIEND_DELETE_COUNT: @user_instance.FRIEND_DELETE_COUNT, FRIEND_POINT: @user_instance.FRIEND_POINT, INFI_TOWER_FLOOR: @user_instance.INFI_TOWER_FLOOR, LASTEST_ACTIVE_TIME: @user_instance.LASTEST_ACTIVE_TIME, LASTEST_CHR_ID: @user_instance.LASTEST_CHR_ID, LASTEST_CHR_LV: @user_instance.LASTEST_CHR_LV, MASTERY_POINT: @user_instance.MASTERY_POINT, MASTERY_RESET_COUNT: @user_instance.MASTERY_RESET_COUNT, MONEY: @user_instance.MONEY, NICKNAME: @user_instance.NICKNAME, PERMISSION: @user_instance.PERMISSION, POSTBOX_SLOT: @user_instance.POSTBOX_SLOT, STAMINA_ADVENTURE: @user_instance.STAMINA_ADVENTURE, STAMINA_ADVENTURE_TIME: @user_instance.STAMINA_ADVENTURE_TIME, STAMINA_PVP: @user_instance.STAMINA_PVP, STAMINA_PVP_TIME: @user_instance.STAMINA_PVP_TIME, STAMINA_SPECIAL: @user_instance.STAMINA_SPECIAL, STAMINA_SPECIAL_TIME: @user_instance.STAMINA_SPECIAL_TIME, USER_ID: @user_instance.USER_ID, USER_LV: @user_instance.USER_LV, USER_NO: @user_instance.USER_NO }
    assert_redirected_to user_instance_path(assigns(:user_instance))
  end

  test "should destroy user_instance" do
    assert_difference('UserInstance.count', -1) do
      delete :destroy, id: @user_instance
    end

    assert_redirected_to user_instances_path
  end
end
