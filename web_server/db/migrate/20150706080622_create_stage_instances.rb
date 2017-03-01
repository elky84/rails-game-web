class CreateStageInstances < ActiveRecord::Migration
  def change
    create_table :stage_instances do |t|
      t.integer :STAGE_PROGRESS_NO
      t.integer :USER_NO
      t.integer :STAGE_ID
      t.text :CLEAR_EXP_NO
      t.text :CLEAR_MONEY_NO
      t.text :CLEAR_REWARD_NO
      t.text :START_DATE

      t.timestamps
    end
    add_index :stage_instances, :STAGE_PROGRESS_NO
  end
end
