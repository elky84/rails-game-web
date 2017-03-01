json.array!(@quest_schedules) do |quest_schedule|
  json.extract! quest_schedule, :id, :QUEST_SCHEDULE_ID, :QUEST_SCHEDULE_TYPE, :ODD_OR_EVEN, :START, :END, :EXPLAIN
  json.url quest_schedule_url(quest_schedule, format: :json)
end
