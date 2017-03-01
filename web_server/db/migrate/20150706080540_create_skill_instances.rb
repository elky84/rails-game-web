class CreateSkillInstances < ActiveRecord::Migration
  def change
    create_table :skill_instances do |t|
      t.integer :SKILL_NO
      t.integer :CHARACTER_NO
      t.integer :SKILL_ID
      t.integer :SKILL_LEVEL
      t.integer :SLOT_NO

      t.timestamps
    end
    add_index :skill_instances, :SKILL_NO
  end
end
