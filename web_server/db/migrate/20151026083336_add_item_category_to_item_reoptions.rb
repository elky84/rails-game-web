class AddItemCategoryToItemReoptions < ActiveRecord::Migration
  def change
    add_column :item_reoptions, :ITEM_CATEGORY, :string
  end
end
