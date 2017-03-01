class CreateAiScripts < ActiveRecord::Migration
  def change
    create_table :ai_scripts do |t|
      t.integer :index
      t.text :ai_type
      t.text :protect_object_name
      t.text :protect_range
      t.text :search_range
      t.text :search_enemy_type
      t.text :idle_time_stop
      t.text :idle_time_random_range
      t.text :attack_time_stop
      t.text :idle_move_range
      t.text :go_away_time
      t.text :go_away_plus_random
      t.text :state_stay_time
      t.text :state_stay_fix_time
      t.text :skill_use_percent
      t.text :attack_after_type
      t.integer :is_all_include_phase
      t.integer :is_reset_under_attack

      t.timestamps
    end
    add_index :ai_scripts, :index
  end
end
