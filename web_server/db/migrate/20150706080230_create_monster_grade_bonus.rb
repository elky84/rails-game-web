class CreateMonsterGradeBonus < ActiveRecord::Migration
  def change
    create_table :monster_grade_bonus do |t|
      t.integer :GRADE
      t.integer :STATUS_ID

      t.timestamps
    end
    add_index :monster_grade_bonus, :GRADE
  end
end
