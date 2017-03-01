class CreateQuestInfos < ActiveRecord::Migration
  def change
    create_table :quest_infos do |t|
      t.integer :QUEST_INFO_ID
      t.integer :NEXT_QUEST_ID
      t.integer :QUEST_SCHEDULE_ID
      t.integer :QUEST_TYPE_ID
      t.text :QUEST_GRADE_TYPE
      t.integer :GRADE
      t.text :PREVIEW
      t.integer :MAXVALUE
      t.text :REWARD
      t.integer :SHORT_CUT

      t.timestamps
    end
    add_index :quest_infos, :QUEST_INFO_ID
  end
end
