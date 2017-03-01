require 'test_helper'

class MonstersControllerTest < ActionController::TestCase
  setup do
    @monster = monsters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monsters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monster" do
    assert_difference('Monster.count') do
      post :create, monster: { ATTACK: @monster.ATTACK, ATTACK_SPEED: @monster.ATTACK_SPEED, CRITICAL_AVOID: @monster.CRITICAL_AVOID, CRITICAL_DAMAGE_PERCENT: @monster.CRITICAL_DAMAGE_PERCENT, CRITICAL_HIT: @monster.CRITICAL_HIT, DEFENCE: @monster.DEFENCE, EXP: @monster.EXP, HP: @monster.HP, LEVEL: @monster.LEVEL, MONSTER_ID: @monster.MONSTER_ID, MONSTER_NO: @monster.MONSTER_NO, MOVE_SPEED: @monster.MOVE_SPEED, MP: @monster.MP, REGEN_HEALTH: @monster.REGEN_HEALTH, REGEN_MP: @monster.REGEN_MP, USER_NO: @monster.USER_NO }
    end

    assert_redirected_to monster_path(assigns(:monster))
  end

  test "should show monster" do
    get :show, id: @monster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monster
    assert_response :success
  end

  test "should update monster" do
    patch :update, id: @monster, monster: { ATTACK: @monster.ATTACK, ATTACK_SPEED: @monster.ATTACK_SPEED, CRITICAL_AVOID: @monster.CRITICAL_AVOID, CRITICAL_DAMAGE_PERCENT: @monster.CRITICAL_DAMAGE_PERCENT, CRITICAL_HIT: @monster.CRITICAL_HIT, DEFENCE: @monster.DEFENCE, EXP: @monster.EXP, HP: @monster.HP, LEVEL: @monster.LEVEL, MONSTER_ID: @monster.MONSTER_ID, MONSTER_NO: @monster.MONSTER_NO, MOVE_SPEED: @monster.MOVE_SPEED, MP: @monster.MP, REGEN_HEALTH: @monster.REGEN_HEALTH, REGEN_MP: @monster.REGEN_MP, USER_NO: @monster.USER_NO }
    assert_redirected_to monster_path(assigns(:monster))
  end

  test "should destroy monster" do
    assert_difference('Monster.count', -1) do
      delete :destroy, id: @monster
    end

    assert_redirected_to monsters_path
  end
end
