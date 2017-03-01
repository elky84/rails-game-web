class CreateUserInstances < ActiveRecord::Migration
  def change
    create_table :user_instances do |t|
      t.integer :USER_NO
      t.text :USER_ID
      t.integer :USER_LV
      t.integer :EXP
      t.text :NICKNAME
      t.integer :CASH
      t.integer :MONEY
      t.timestamp :STAMINA_ADVENTURE_TIME
      t.integer :STAMINA_ADVENTURE
      t.timestamp :STAMINA_SPECIAL_TIME
      t.integer :STAMINA_SPECIAL
      t.timestamp :STAMINA_PVP_TIME
      t.integer :STAMINA_PVP
      t.integer :FRIEND_POINT
      t.integer :POSTBOX_SLOT
      t.integer :CACHE_MONSTER_SLOT
      t.integer :EXT_MONSTER_SLOT
      t.integer :CACHE_ITEM_SLOT
      t.integer :EXT_ITEM_SLOT
      t.integer :CACHE_FRIEND_SLOT
      t.integer :EXT_FRIEND_COUNT
      t.integer :MASTERY_RESET_COUNT
      t.timestamp :LASTEST_ACTIVE_TIME
      t.text :PERMISSION
      t.integer :LASTEST_CHR_ID
      t.integer :LASTEST_CHR_LV

      t.timestamps
    end
    add_index :user_instances, :USER_NO
  end
end
