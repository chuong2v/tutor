class CreateTutorLevels < ActiveRecord::Migration
  def change
    create_table :tutor_levels do |t|
      t.integer :level_id
      t.integer :td_id

      t.timestamps null: false
    end
  end
end
