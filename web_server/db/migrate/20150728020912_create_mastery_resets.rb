class CreateMasteryResets < ActiveRecord::Migration
  def change
    create_table :mastery_resets do |t|
      t.integer :MASTERY_RESET_ID
      t.text :COST

      t.timestamps
    end
    add_index :mastery_resets, :MASTERY_RESET_ID
  end
end
