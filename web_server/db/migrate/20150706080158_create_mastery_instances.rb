class CreateMasteryInstances < ActiveRecord::Migration
  def change
    create_table :mastery_instances do |t|
      t.integer :MASTERY_NO
      t.integer :GROUP_NO
      t.integer :USER_NO
      t.integer :CHARACTER_NO
      t.text :MASTERY

      t.timestamps
    end
    add_index :mastery_instances, :GROUP_NO
  end
end
