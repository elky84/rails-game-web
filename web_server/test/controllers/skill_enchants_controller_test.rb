require 'test_helper'

class SkillEnchantsControllerTest < ActionController::TestCase
  setup do
    @skill_enchant = skill_enchants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:skill_enchants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create skill_enchant" do
    assert_difference('SkillEnchant.count') do
      post :create, skill_enchant: { ENCHANT_NUM: @skill_enchant.ENCHANT_NUM, ENCHANT_PERCENT: @skill_enchant.ENCHANT_PERCENT, ENCHANT_RESULT: @skill_enchant.ENCHANT_RESULT, EQUAL_MONSTER_BONUS: @skill_enchant.EQUAL_MONSTER_BONUS, MONEY: @skill_enchant.MONEY, MONSTER_GRADE: @skill_enchant.MONSTER_GRADE, SKILL_ENCHANT_ID: @skill_enchant.SKILL_ENCHANT_ID }
    end

    assert_redirected_to skill_enchant_path(assigns(:skill_enchant))
  end

  test "should show skill_enchant" do
    get :show, id: @skill_enchant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @skill_enchant
    assert_response :success
  end

  test "should update skill_enchant" do
    patch :update, id: @skill_enchant, skill_enchant: { ENCHANT_NUM: @skill_enchant.ENCHANT_NUM, ENCHANT_PERCENT: @skill_enchant.ENCHANT_PERCENT, ENCHANT_RESULT: @skill_enchant.ENCHANT_RESULT, EQUAL_MONSTER_BONUS: @skill_enchant.EQUAL_MONSTER_BONUS, MONEY: @skill_enchant.MONEY, MONSTER_GRADE: @skill_enchant.MONSTER_GRADE, SKILL_ENCHANT_ID: @skill_enchant.SKILL_ENCHANT_ID }
    assert_redirected_to skill_enchant_path(assigns(:skill_enchant))
  end

  test "should destroy skill_enchant" do
    assert_difference('SkillEnchant.count', -1) do
      delete :destroy, id: @skill_enchant
    end

    assert_redirected_to skill_enchants_path
  end
end
