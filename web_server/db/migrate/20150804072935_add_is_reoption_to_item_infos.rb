class AddIsReoptionToItemInfos < ActiveRecord::Migration
  def change
    add_column :item_infos, :IS_REOPTION, :integer
  end
end
