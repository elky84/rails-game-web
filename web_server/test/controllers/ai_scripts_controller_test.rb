require 'test_helper'

class AiScriptsControllerTest < ActionController::TestCase
  setup do
    @ai_script = ai_scripts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ai_scripts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ai_script" do
    assert_difference('AiScript.count') do
      post :create, ai_script: { add_serch_range: @ai_script.add_serch_range, ai_type: @ai_script.ai_type, attack_after_type: @ai_script.attack_after_type, attack_time_stop: @ai_script.attack_time_stop, fixed_idle_stay_time: @ai_script.fixed_idle_stay_time, go_away_plus_random: @ai_script.go_away_plus_random, go_away_time: @ai_script.go_away_time, idle_move_range: @ai_script.idle_move_range, idle_time_random_range: @ai_script.idle_time_random_range, idle_time_stop: @ai_script.idle_time_stop, index: @ai_script.index, is_all_include_phase: @ai_script.is_all_include_phase, is_reset_under_attack: @ai_script.is_reset_under_attack, protect_object_name: @ai_script.protect_object_name, protect_range: @ai_script.protect_range, search_enemy_type: @ai_script.search_enemy_type, search_range: @ai_script.search_range, skill_use_percent: @ai_script.skill_use_percent, state_stay_time: @ai_script.state_stay_time }
    end

    assert_redirected_to ai_script_path(assigns(:ai_script))
  end

  test "should show ai_script" do
    get :show, id: @ai_script
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ai_script
    assert_response :success
  end

  test "should update ai_script" do
    patch :update, id: @ai_script, ai_script: { add_serch_range: @ai_script.add_serch_range, ai_type: @ai_script.ai_type, attack_after_type: @ai_script.attack_after_type, attack_time_stop: @ai_script.attack_time_stop, fixed_idle_stay_time: @ai_script.fixed_idle_stay_time, go_away_plus_random: @ai_script.go_away_plus_random, go_away_time: @ai_script.go_away_time, idle_move_range: @ai_script.idle_move_range, idle_time_random_range: @ai_script.idle_time_random_range, idle_time_stop: @ai_script.idle_time_stop, index: @ai_script.index, is_all_include_phase: @ai_script.is_all_include_phase, is_reset_under_attack: @ai_script.is_reset_under_attack, protect_object_name: @ai_script.protect_object_name, protect_range: @ai_script.protect_range, search_enemy_type: @ai_script.search_enemy_type, search_range: @ai_script.search_range, skill_use_percent: @ai_script.skill_use_percent, state_stay_time: @ai_script.state_stay_time }
    assert_redirected_to ai_script_path(assigns(:ai_script))
  end

  test "should destroy ai_script" do
    assert_difference('AiScript.count', -1) do
      delete :destroy, id: @ai_script
    end

    assert_redirected_to ai_scripts_path
  end
end
