class CreateCharacterInstances < ActiveRecord::Migration
  def change
    create_table :character_instances do |t|
      t.integer :CHARACTER_NO
      t.integer :USER_NO
      t.integer :CHARACTER_ID
      t.integer :LEVEL
      t.integer :EXP
      t.timestamp :LASTEST_ACTIVE_TIME
      t.integer :MASTERY_GROUP_ID
      t.text :PARTY_MONSTER_ID
      t.integer :STAGE_INSTANCE_NO

      t.timestamps
    end
    add_index :character_instances, :CHARACTER_NO
  end
end
