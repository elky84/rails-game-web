class CreateSkillScripts < ActiveRecord::Migration
  def change
    create_table :skill_scripts do |t|
      t.integer :SKILL_ID
      t.text :CHARACTER_TYPE
      t.text :SKILL_CATEGORY
      t.text :TYPE
      t.integer :LEVEL
      t.integer :LEARN_LEVEL
      t.integer :SKILL_GROUP_ID
      t.text :PRE_SKILL
      t.text :PASSIVE_APPLY_SKILL
      t.text :LEARN_CONDITION
      t.text :ICON
      t.text :NAME
      t.text :EXPLAIN
      t.integer :ACTIVE_ID
      t.text :TRIGGER
      t.text :SKILL_REACTION_ID
      t.text :SKILL_OPTION_ID
      t.text :POWER
      t.text :SPEND_MP
      t.text :SPEND_HP

      t.timestamps
    end
    add_index :skill_scripts, :SKILL_ID
  end
end
