class CreateQuestInstances < ActiveRecord::Migration
  def change
    create_table :quest_instances do |t|
      t.integer :QUEST_NO
      t.text :TYPE
      t.integer :QUEST_INFO_ID
      t.integer :USER_NO
      t.integer :QUEST_VALUE
      t.timestamp :ACTIVE_TIME
      t.integer :CLEAR
      t.timestamp :CLEAR_TIME

      t.timestamps
    end
    add_index :quest_instances, :QUEST_NO
  end
end
