class AddMoneyToItemReoptions < ActiveRecord::Migration
  def change
    add_column :item_reoptions, :MONEY, :string
  end
end
