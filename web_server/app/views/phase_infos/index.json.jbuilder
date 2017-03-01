json.array!(@phase_infos) do |phase_info|
  json.extract! phase_info, :id, :PHASE_ID, :INIT_POS, :MOVE_TIME, :CLEAR, :WAIT_TIME, :STAY_TIME, :MONSTER, :MONSTER_GEN_INFO, :MONSTER_LV, :APPEAR_SPEED, :APPEAR_TIME, :TEAM_INDEX, :START_SCENARIO, :END_SCENARIO, :IS_BOSS_PHASE, :PHASE_WIDTH
  json.url phase_info_url(phase_info, format: :json)
end
