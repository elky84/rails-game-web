class CreatePvpRankCacheInstances < ActiveRecord::Migration
  def change
    create_table :pvp_rank_cache_instances do |t|
      t.integer :PVP_RANK_CACHE_INSTANCE_NO
      t.integer :RANK
      t.integer :CHARACTER_NO
      t.integer :RATING

      t.timestamps
    end
    add_index :pvp_rank_cache_instances, :PVP_RANK_CACHE_INSTANCE_NO
  end
end
