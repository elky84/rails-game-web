require 'test_helper'

class SkillScriptsControllerTest < ActionController::TestCase
  setup do
    @skill_script = skill_scripts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:skill_scripts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create skill_script" do
    assert_difference('SkillScript.count') do
      post :create, skill_script: { ACTIVE_ID: @skill_script.ACTIVE_ID, CHARACTER_TYPE: @skill_script.CHARACTER_TYPE, EXPLAIN: @skill_script.EXPLAIN, ICON: @skill_script.ICON, LEARN_CONDITION: @skill_script.LEARN_CONDITION, LEARN_LEVEL: @skill_script.LEARN_LEVEL, LEVEL: @skill_script.LEVEL, NAME: @skill_script.NAME, PASSIVE_APPLY_SKILL: @skill_script.PASSIVE_APPLY_SKILL, POWER: @skill_script.POWER, PRE_SKILL: @skill_script.PRE_SKILL, RANGE_CHECK_REACTION_INDEX: @skill_script.RANGE_CHECK_REACTION_INDEX, SKILL_CATEGORY: @skill_script.SKILL_CATEGORY, SKILL_GROUP_ID: @skill_script.SKILL_GROUP_ID, SKILL_ID: @skill_script.SKILL_ID, SKILL_OPTION_ID: @skill_script.SKILL_OPTION_ID, SKILL_REACTION_ID: @skill_script.SKILL_REACTION_ID, SPEND_HP: @skill_script.SPEND_HP, SPEND_MP: @skill_script.SPEND_MP, TRIGGER: @skill_script.TRIGGER, TYPE: @skill_script.TYPE }
    end

    assert_redirected_to skill_script_path(assigns(:skill_script))
  end

  test "should show skill_script" do
    get :show, id: @skill_script
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @skill_script
    assert_response :success
  end

  test "should update skill_script" do
    patch :update, id: @skill_script, skill_script: { ACTIVE_ID: @skill_script.ACTIVE_ID, CHARACTER_TYPE: @skill_script.CHARACTER_TYPE, EXPLAIN: @skill_script.EXPLAIN, ICON: @skill_script.ICON, LEARN_CONDITION: @skill_script.LEARN_CONDITION, LEARN_LEVEL: @skill_script.LEARN_LEVEL, LEVEL: @skill_script.LEVEL, NAME: @skill_script.NAME, PASSIVE_APPLY_SKILL: @skill_script.PASSIVE_APPLY_SKILL, POWER: @skill_script.POWER, PRE_SKILL: @skill_script.PRE_SKILL, RANGE_CHECK_REACTION_INDEX: @skill_script.RANGE_CHECK_REACTION_INDEX, SKILL_CATEGORY: @skill_script.SKILL_CATEGORY, SKILL_GROUP_ID: @skill_script.SKILL_GROUP_ID, SKILL_ID: @skill_script.SKILL_ID, SKILL_OPTION_ID: @skill_script.SKILL_OPTION_ID, SKILL_REACTION_ID: @skill_script.SKILL_REACTION_ID, SPEND_HP: @skill_script.SPEND_HP, SPEND_MP: @skill_script.SPEND_MP, TRIGGER: @skill_script.TRIGGER, TYPE: @skill_script.TYPE }
    assert_redirected_to skill_script_path(assigns(:skill_script))
  end

  test "should destroy skill_script" do
    assert_difference('SkillScript.count', -1) do
      delete :destroy, id: @skill_script
    end

    assert_redirected_to skill_scripts_path
  end
end
