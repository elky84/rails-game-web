class CreateQuestTypes < ActiveRecord::Migration
  def change
    create_table :quest_types do |t|
      t.integer :QUEST_TYPE_ID
      t.text :QUEST_ICON
      t.text :TYPE
      t.text :QUEST_NAME
      t.text :QUEST_EXPLAIN
      t.text :GUIDE_CHAR_IMAGE
      t.text :QUEST_COMPLETE_EXPLAIN

      t.timestamps
    end
    add_index :quest_types, :QUEST_TYPE_ID
  end
end
