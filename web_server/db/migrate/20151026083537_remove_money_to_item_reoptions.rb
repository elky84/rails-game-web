class RemoveMoneyToItemReoptions < ActiveRecord::Migration
  def change
    remove_column :item_reoptions, :MONEY, :integer
  end
end
