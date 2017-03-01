json.array!(@monster_grade_bonus) do |monster_grade_bonu|
  json.extract! monster_grade_bonu, :id, :GRADE, :STATUS_ID
  json.url monster_grade_bonu_url(monster_grade_bonu, format: :json)
end
