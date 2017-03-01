class CreateServerLists < ActiveRecord::Migration
  def change
    create_table :server_lists do |t|
      t.integer :INDEX
      t.text :SERVER_TYPE
      t.text :ADDRESS
      t.text :NAME
      t.integer :CU

      t.timestamps
    end
    add_index :server_lists, :INDEX
  end
end
