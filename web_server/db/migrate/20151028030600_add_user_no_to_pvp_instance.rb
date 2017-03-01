class AddUserNoToPvpInstance < ActiveRecord::Migration
  def change
    add_column :pvp_instances, :USER_NO, :integer 
    add_index :pvp_instances, :USER_NO 
  end
end
