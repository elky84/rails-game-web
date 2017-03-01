json.array!(@ai_scripts) do |ai_script|
  json.extract! ai_script, :id, :index, :ai_type, :protect_object_name, :protect_range, :search_range, :search_enemy_type, :idle_time_stop, :idle_time_random_range, :attack_time_stop, :idle_move_range, :go_away_time, :go_away_plus_random, :state_stay_time, :fixed_idle_stay_time, :skill_use_percent, :attack_after_type, :is_all_include_phase, :is_reset_under_attack, :add_serch_range
  json.url ai_script_url(ai_script, format: :json)
end
