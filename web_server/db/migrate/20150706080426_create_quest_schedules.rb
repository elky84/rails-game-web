class CreateQuestSchedules < ActiveRecord::Migration
  def change
    create_table :quest_schedules do |t|
      t.integer :QUEST_SCHEDULE_ID
      t.text :QUEST_SCHEDULE_TYPE
      t.text :ODD_OR_EVEN
      t.timestamp :START
      t.timestamp :END
      t.text :EXPLAIN

      t.timestamps
    end
    add_index :quest_schedules, :QUEST_SCHEDULE_ID
  end
end
