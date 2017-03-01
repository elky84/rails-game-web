class CreateItemOptionInfos < ActiveRecord::Migration
  def change
    create_table :item_option_infos do |t|
      t.integer :ITEM_OPTION_INFO_ID
      t.string :CONDITION_ID
      t.string :PARAMETER_ID
      t.string :DESCRIPTION
      t.string :UI_SCRIPT

      t.timestamps
    end
  end
end
