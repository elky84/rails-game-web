class CreateMasteryPointInfos < ActiveRecord::Migration
  def change
    create_table :mastery_point_infos do |t|
      t.integer :MASTERY_POINT
      t.text :PRICE_TYPE
      t.integer :PRICE

      t.timestamps
    end
    add_index :mastery_point_infos, :MASTERY_POINT
  end
end
