class CreateUserLevelData < ActiveRecord::Migration
  def change
    create_table :user_level_data do |t|
      t.integer :LEVEL
      t.integer :REQUIRE_EXP
      t.integer :STAMINA

      t.timestamps
    end
  end
end
