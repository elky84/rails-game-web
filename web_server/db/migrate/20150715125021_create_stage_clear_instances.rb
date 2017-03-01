class CreateStageClearInstances < ActiveRecord::Migration
  def change
    create_table :stage_clear_instances do |t|
      t.integer :USER_NO
      t.integer :CHARACTER_NO
      t.text :PLAY_STAGE
      t.text :CLEAR_STAGE
      t.text :STAGE_SCORE
      t.timestamp :LAST_DATE

      t.timestamps
    end
    add_index :stage_clear_instances, :CHARACTER_NO
  end
end
