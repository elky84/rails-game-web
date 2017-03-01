class CreateQuestShortCuts < ActiveRecord::Migration
  def change
    create_table :quest_short_cuts do |t|
      t.integer :SHORT_CUT_NO
      t.text :SHORT_CUT_TYPE

      t.timestamps
    end
    add_index :quest_short_cuts, :SHORT_CUT_NO
  end
end
