require 'test_helper'

class MonsterInfosControllerTest < ActionController::TestCase
  setup do
    @monster_info = monster_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monster_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monster_info" do
    assert_difference('MonsterInfo.count') do
      post :create, monster_info: { ACTOR_ID: @monster_info.ACTOR_ID, GACHA_SPEECH: @monster_info.GACHA_SPEECH, GROW_TYPE: @monster_info.GROW_TYPE, GROW_TYPE_DETAIL: @monster_info.GROW_TYPE_DETAIL, MONSTER_GRADE: @monster_info.MONSTER_GRADE, MONSTER_ID: @monster_info.MONSTER_ID, MONSTER_PRICE: @monster_info.MONSTER_PRICE, MONSTER_TYPE: @monster_info.MONSTER_TYPE, SKIN_NUM: @monster_info.SKIN_NUM }
    end

    assert_redirected_to monster_info_path(assigns(:monster_info))
  end

  test "should show monster_info" do
    get :show, id: @monster_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monster_info
    assert_response :success
  end

  test "should update monster_info" do
    patch :update, id: @monster_info, monster_info: { ACTOR_ID: @monster_info.ACTOR_ID, GACHA_SPEECH: @monster_info.GACHA_SPEECH, GROW_TYPE: @monster_info.GROW_TYPE, GROW_TYPE_DETAIL: @monster_info.GROW_TYPE_DETAIL, MONSTER_GRADE: @monster_info.MONSTER_GRADE, MONSTER_ID: @monster_info.MONSTER_ID, MONSTER_PRICE: @monster_info.MONSTER_PRICE, MONSTER_TYPE: @monster_info.MONSTER_TYPE, SKIN_NUM: @monster_info.SKIN_NUM }
    assert_redirected_to monster_info_path(assigns(:monster_info))
  end

  test "should destroy monster_info" do
    assert_difference('MonsterInfo.count', -1) do
      delete :destroy, id: @monster_info
    end

    assert_redirected_to monster_infos_path
  end
end
