json.array!(@scenario_scripts) do |scenario_script|
  json.extract! scenario_script, :id, :INDEX, :DIALOGUE_TYPE, :DIALOGUE_EFFECT, :SPEECH_BACK, :CHARACTER_FACE, :FACE_POS, :CHARACOTR_INDEX, :STRING_INDEX
  json.url scenario_script_url(scenario_script, format: :json)
end
