require 'test_helper'

class CharactersControllerTest < ActionController::TestCase
  setup do
    @character = characters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:characters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create character" do
    assert_difference('Character.count') do
      post :create, character: { ATTACK: @character.ATTACK, ATTACK_SPEED: @character.ATTACK_SPEED, CHARACTER_ID: @character.CHARACTER_ID, CHARACTER_NO: @character.CHARACTER_NO, CRITICAL_AVOID: @character.CRITICAL_AVOID, CRITICAL_DAMAGE_PERCENT: @character.CRITICAL_DAMAGE_PERCENT, CRITICAL_HIT: @character.CRITICAL_HIT, DEFENCE: @character.DEFENCE, EXP: @character.EXP, HP: @character.HP, LASTEST_ACTIVE_TIME: @character.LASTEST_ACTIVE_TIME, LEVEL: @character.LEVEL, MASTERY_GROUP_ID: @character.MASTERY_GROUP_ID, MOVE_SPEED: @character.MOVE_SPEED, MP: @character.MP, REGEN_HEALTH: @character.REGEN_HEALTH, REGEN_MP: @character.REGEN_MP, STAGE_INSTANCE_NO: @character.STAGE_INSTANCE_NO, USER_NO: @character.USER_NO }
    end

    assert_redirected_to character_path(assigns(:character))
  end

  test "should show character" do
    get :show, id: @character
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @character
    assert_response :success
  end

  test "should update character" do
    patch :update, id: @character, character: { ATTACK: @character.ATTACK, ATTACK_SPEED: @character.ATTACK_SPEED, CHARACTER_ID: @character.CHARACTER_ID, CHARACTER_NO: @character.CHARACTER_NO, CRITICAL_AVOID: @character.CRITICAL_AVOID, CRITICAL_DAMAGE_PERCENT: @character.CRITICAL_DAMAGE_PERCENT, CRITICAL_HIT: @character.CRITICAL_HIT, DEFENCE: @character.DEFENCE, EXP: @character.EXP, HP: @character.HP, LASTEST_ACTIVE_TIME: @character.LASTEST_ACTIVE_TIME, LEVEL: @character.LEVEL, MASTERY_GROUP_ID: @character.MASTERY_GROUP_ID, MOVE_SPEED: @character.MOVE_SPEED, MP: @character.MP, REGEN_HEALTH: @character.REGEN_HEALTH, REGEN_MP: @character.REGEN_MP, STAGE_INSTANCE_NO: @character.STAGE_INSTANCE_NO, USER_NO: @character.USER_NO }
    assert_redirected_to character_path(assigns(:character))
  end

  test "should destroy character" do
    assert_difference('Character.count', -1) do
      delete :destroy, id: @character
    end

    assert_redirected_to characters_path
  end
end
