class CreateActorStatusScripts < ActiveRecord::Migration
  def change
    create_table :actor_status_scripts do |t|
      t.integer :index
      t.text :SKILL_TYPE
      t.text :scale_x
      t.text :scale_y
      t.text :spine_name
      t.text :ui_sprite_name
      t.text :actor_name
      t.text :skill_list
      t.text :random_skill_list
      t.text :random_skill_percent
      t.integer :shadow
      t.text :shadow_scale_x
      t.text :shadow_scale_y
      t.integer :attack_count_max
      t.integer :ai_index
      t.integer :die_animation_curve
      t.text :HP
      t.text :MP
      t.text :ATTACK
      t.text :DEFENCE
      t.text :HIT
      t.text :AVOID
      t.text :CRITICAL_HIT
      t.text :CRITICAL_AVOID
      t.text :CRITICAL_DAMAGE_PERCENT
      t.text :REGEN_HEALTH
      t.text :REGEN_MP
      t.text :MOVE_SPEED_X
      t.text :MOVE_SPEED_Z
      t.text :ATTACK_SPEED
      t.text :RAGE_BASE
      t.text :RAGE_REGEN
      t.text :COOL_TIME_ALL
      t.text :RESIST_POISON
      t.text :RESIST_SILENCE
      t.text :RESIST_STUN
      t.text :RESIST_SLOW
      t.integer :LEVEL

      t.timestamps
    end
    add_index :actor_status_scripts, :index
  end
end
