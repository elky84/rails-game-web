class CreatePvpRanges < ActiveRecord::Migration
  def change
    create_table :pvp_ranges do |t|
      t.integer :PVP_RANGE_ID
      t.integer :RATING
      t.integer :RANK
      t.integer :ADD_RANK

      t.timestamps
    end
    add_index :pvp_ranges, :PVP_RANGE_ID
  end
end
