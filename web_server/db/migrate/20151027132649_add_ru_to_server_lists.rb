class AddRuToServerLists < ActiveRecord::Migration
  def change
    add_column :server_lists, :RU, :integer
  end
end
