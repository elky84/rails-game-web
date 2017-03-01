require 'test_helper'

class MonsterGenInfosControllerTest < ActionController::TestCase
  setup do
    @monster_gen_info = monster_gen_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monster_gen_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monster_gen_info" do
    assert_difference('MonsterGenInfo.count') do
      post :create, monster_gen_info: { APPEAR_TYPE: @monster_gen_info.APPEAR_TYPE, CURVE: @monster_gen_info.CURVE, DEAD_AFTER_APPEAR: @monster_gen_info.DEAD_AFTER_APPEAR, DIRECTION: @monster_gen_info.DIRECTION, INDEX: @monster_gen_info.INDEX, JUMP_SPEED: @monster_gen_info.JUMP_SPEED, MOVE_FROM: @monster_gen_info.MOVE_FROM, POSITION: @monster_gen_info.POSITION }
    end

    assert_redirected_to monster_gen_info_path(assigns(:monster_gen_info))
  end

  test "should show monster_gen_info" do
    get :show, id: @monster_gen_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monster_gen_info
    assert_response :success
  end

  test "should update monster_gen_info" do
    patch :update, id: @monster_gen_info, monster_gen_info: { APPEAR_TYPE: @monster_gen_info.APPEAR_TYPE, CURVE: @monster_gen_info.CURVE, DEAD_AFTER_APPEAR: @monster_gen_info.DEAD_AFTER_APPEAR, DIRECTION: @monster_gen_info.DIRECTION, INDEX: @monster_gen_info.INDEX, JUMP_SPEED: @monster_gen_info.JUMP_SPEED, MOVE_FROM: @monster_gen_info.MOVE_FROM, POSITION: @monster_gen_info.POSITION }
    assert_redirected_to monster_gen_info_path(assigns(:monster_gen_info))
  end

  test "should destroy monster_gen_info" do
    assert_difference('MonsterGenInfo.count', -1) do
      delete :destroy, id: @monster_gen_info
    end

    assert_redirected_to monster_gen_infos_path
  end
end
