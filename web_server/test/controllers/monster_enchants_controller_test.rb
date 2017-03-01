require 'test_helper'

class MonsterEnchantsControllerTest < ActionController::TestCase
  setup do
    @monster_enchant = monster_enchants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monster_enchants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monster_enchant" do
    assert_difference('MonsterEnchant.count') do
      post :create, monster_enchant: { BASE_EXP: @monster_enchant.BASE_EXP, BASE_MONEY: @monster_enchant.BASE_MONEY, ENCHANT_PERCENT: @monster_enchant.ENCHANT_PERCENT, ENCHANT_RESULT: @monster_enchant.ENCHANT_RESULT, EQUAL_MONSTER_EXP_BONUS: @monster_enchant.EQUAL_MONSTER_EXP_BONUS, EQUAL_MONSTER_SKILL_BONUS: @monster_enchant.EQUAL_MONSTER_SKILL_BONUS, LEVEL_BONUS_EXP: @monster_enchant.LEVEL_BONUS_EXP, LEVEL_MONEY: @monster_enchant.LEVEL_MONEY, MONSTER_ENCHANT_ID: @monster_enchant.MONSTER_ENCHANT_ID, MONSTER_GRADE: @monster_enchant.MONSTER_GRADE }
    end

    assert_redirected_to monster_enchant_path(assigns(:monster_enchant))
  end

  test "should show monster_enchant" do
    get :show, id: @monster_enchant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monster_enchant
    assert_response :success
  end

  test "should update monster_enchant" do
    patch :update, id: @monster_enchant, monster_enchant: { BASE_EXP: @monster_enchant.BASE_EXP, BASE_MONEY: @monster_enchant.BASE_MONEY, ENCHANT_PERCENT: @monster_enchant.ENCHANT_PERCENT, ENCHANT_RESULT: @monster_enchant.ENCHANT_RESULT, EQUAL_MONSTER_EXP_BONUS: @monster_enchant.EQUAL_MONSTER_EXP_BONUS, EQUAL_MONSTER_SKILL_BONUS: @monster_enchant.EQUAL_MONSTER_SKILL_BONUS, LEVEL_BONUS_EXP: @monster_enchant.LEVEL_BONUS_EXP, LEVEL_MONEY: @monster_enchant.LEVEL_MONEY, MONSTER_ENCHANT_ID: @monster_enchant.MONSTER_ENCHANT_ID, MONSTER_GRADE: @monster_enchant.MONSTER_GRADE }
    assert_redirected_to monster_enchant_path(assigns(:monster_enchant))
  end

  test "should destroy monster_enchant" do
    assert_difference('MonsterEnchant.count', -1) do
      delete :destroy, id: @monster_enchant
    end

    assert_redirected_to monster_enchants_path
  end
end
