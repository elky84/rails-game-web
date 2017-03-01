require 'test_helper'

class ActorStatusScriptsControllerTest < ActionController::TestCase
  setup do
    @actor_status_script = actor_status_scripts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:actor_status_scripts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create actor_status_script" do
    assert_difference('ActorStatusScript.count') do
      post :create, actor_status_script: { ATTACK: @actor_status_script.ATTACK, ATTACK_SPEED: @actor_status_script.ATTACK_SPEED, AVOID: @actor_status_script.AVOID, COOL_TIME_ALL: @actor_status_script.COOL_TIME_ALL, CRITICAL_AVOID: @actor_status_script.CRITICAL_AVOID, CRITICAL_DAMAGE_PERCENT: @actor_status_script.CRITICAL_DAMAGE_PERCENT, CRITICAL_HIT: @actor_status_script.CRITICAL_HIT, DEFENCE: @actor_status_script.DEFENCE, DOWN_TIME: @actor_status_script.DOWN_TIME, HIT: @actor_status_script.HIT, HP: @actor_status_script.HP, LEVEL: @actor_status_script.LEVEL, MOVE_SPEED_X: @actor_status_script.MOVE_SPEED_X, MOVE_SPEED_Z: @actor_status_script.MOVE_SPEED_Z, MP: @actor_status_script.MP, OTHER_IDLE_USE: @actor_status_script.OTHER_IDLE_USE, RAGE_BASE: @actor_status_script.RAGE_BASE, RAGE_REGEN: @actor_status_script.RAGE_REGEN, REGEN_HEALTH: @actor_status_script.REGEN_HEALTH, REGEN_MP: @actor_status_script.REGEN_MP, RESIST_POISON: @actor_status_script.RESIST_POISON, RESIST_SILENCE: @actor_status_script.RESIST_SILENCE, RESIST_SLOW: @actor_status_script.RESIST_SLOW, RESIST_STUN: @actor_status_script.RESIST_STUN, SKILL_TYPE: @actor_status_script.SKILL_TYPE, VOICE: @actor_status_script.VOICE, actor_group_id: @actor_status_script.actor_group_id, actor_name: @actor_status_script.actor_name, ai_index: @actor_status_script.ai_index, attack_count_max: @actor_status_script.attack_count_max, die_animation_curve: @actor_status_script.die_animation_curve, die_animation_lenth: @actor_status_script.die_animation_lenth, die_animation_speed: @actor_status_script.die_animation_speed, group_rank_id: @actor_status_script.group_rank_id, home_ani: @actor_status_script.home_ani, index: @actor_status_script.index, random_skill_list: @actor_status_script.random_skill_list, random_skill_percent: @actor_status_script.random_skill_percent, scale_x: @actor_status_script.scale_x, scale_y: @actor_status_script.scale_y, shadow: @actor_status_script.shadow, shadow_scale_x: @actor_status_script.shadow_scale_x, shadow_scale_y: @actor_status_script.shadow_scale_y, skill_list: @actor_status_script.skill_list, special_skill: @actor_status_script.special_skill, special_skill_percent: @actor_status_script.special_skill_percent, spine_name: @actor_status_script.spine_name, ui_sprite_name: @actor_status_script.ui_sprite_name }
    end

    assert_redirected_to actor_status_script_path(assigns(:actor_status_script))
  end

  test "should show actor_status_script" do
    get :show, id: @actor_status_script
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @actor_status_script
    assert_response :success
  end

  test "should update actor_status_script" do
    patch :update, id: @actor_status_script, actor_status_script: { ATTACK: @actor_status_script.ATTACK, ATTACK_SPEED: @actor_status_script.ATTACK_SPEED, AVOID: @actor_status_script.AVOID, COOL_TIME_ALL: @actor_status_script.COOL_TIME_ALL, CRITICAL_AVOID: @actor_status_script.CRITICAL_AVOID, CRITICAL_DAMAGE_PERCENT: @actor_status_script.CRITICAL_DAMAGE_PERCENT, CRITICAL_HIT: @actor_status_script.CRITICAL_HIT, DEFENCE: @actor_status_script.DEFENCE, DOWN_TIME: @actor_status_script.DOWN_TIME, HIT: @actor_status_script.HIT, HP: @actor_status_script.HP, LEVEL: @actor_status_script.LEVEL, MOVE_SPEED_X: @actor_status_script.MOVE_SPEED_X, MOVE_SPEED_Z: @actor_status_script.MOVE_SPEED_Z, MP: @actor_status_script.MP, OTHER_IDLE_USE: @actor_status_script.OTHER_IDLE_USE, RAGE_BASE: @actor_status_script.RAGE_BASE, RAGE_REGEN: @actor_status_script.RAGE_REGEN, REGEN_HEALTH: @actor_status_script.REGEN_HEALTH, REGEN_MP: @actor_status_script.REGEN_MP, RESIST_POISON: @actor_status_script.RESIST_POISON, RESIST_SILENCE: @actor_status_script.RESIST_SILENCE, RESIST_SLOW: @actor_status_script.RESIST_SLOW, RESIST_STUN: @actor_status_script.RESIST_STUN, SKILL_TYPE: @actor_status_script.SKILL_TYPE, VOICE: @actor_status_script.VOICE, actor_group_id: @actor_status_script.actor_group_id, actor_name: @actor_status_script.actor_name, ai_index: @actor_status_script.ai_index, attack_count_max: @actor_status_script.attack_count_max, die_animation_curve: @actor_status_script.die_animation_curve, die_animation_lenth: @actor_status_script.die_animation_lenth, die_animation_speed: @actor_status_script.die_animation_speed, group_rank_id: @actor_status_script.group_rank_id, home_ani: @actor_status_script.home_ani, index: @actor_status_script.index, random_skill_list: @actor_status_script.random_skill_list, random_skill_percent: @actor_status_script.random_skill_percent, scale_x: @actor_status_script.scale_x, scale_y: @actor_status_script.scale_y, shadow: @actor_status_script.shadow, shadow_scale_x: @actor_status_script.shadow_scale_x, shadow_scale_y: @actor_status_script.shadow_scale_y, skill_list: @actor_status_script.skill_list, special_skill: @actor_status_script.special_skill, special_skill_percent: @actor_status_script.special_skill_percent, spine_name: @actor_status_script.spine_name, ui_sprite_name: @actor_status_script.ui_sprite_name }
    assert_redirected_to actor_status_script_path(assigns(:actor_status_script))
  end

  test "should destroy actor_status_script" do
    assert_difference('ActorStatusScript.count', -1) do
      delete :destroy, id: @actor_status_script
    end

    assert_redirected_to actor_status_scripts_path
  end
end
