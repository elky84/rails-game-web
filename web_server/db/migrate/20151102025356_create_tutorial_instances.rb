class CreateTutorialInstances < ActiveRecord::Migration
  def change
    create_table :tutorial_instances do |t|
      t.integer :TUTORIAL_NO
      t.integer :USER_NO
      t.text :FLOW_NO
      t.integer :GACHA_GET_INSTANCE_NO
      t.integer :STAGE_GET_INSTANCE_NO

      t.timestamps
    end
    add_index :tutorial_instances, :TUTORIAL_NO
  end
end
