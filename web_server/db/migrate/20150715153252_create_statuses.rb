class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :STATUS_ID
      t.text :ATTACK
      t.text :DEFENSE
      t.text :HP
      t.text :MP
      t.text :RAGE_BASE
      t.text :ATTACK_SPEED
      t.text :MOVE_SPEED_X
      t.text :MOVE_SPEED_Z
      t.text :CRITICAL_RATE
      t.text :CRITICAL_AVOID
      t.text :CRITICAL_DAMAGE
      t.text :HIT_RATE
      t.text :DODGE_RATE
      t.text :HP_REGEN
      t.text :MP_REGEN
      t.text :RAGE_REGEN
      t.text :COOL_TIME_ALL
      t.text :RESIST_POISON
      t.text :RESIST_SILENCE
      t.text :RESIST_STUN
      t.text :RESIST_SLOW
      t.integer :LEVEL

      t.timestamps
    end
    add_index :statuses, :STATUS_ID
  end
end
