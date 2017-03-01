class CreateUserGrows < ActiveRecord::Migration
  def change
    create_table :user_grows do |t|
      t.integer :GROW_ID
      t.integer :LEVEL
      t.integer :REQUIRE_EXP

      t.timestamps
    end
    add_index :user_grows, :GROW_ID
  end
end
