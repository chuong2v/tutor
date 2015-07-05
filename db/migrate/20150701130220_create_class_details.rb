class CreateClassDetails < ActiveRecord::Migration
  def change
    create_table :class_details do |t|
      t.integer :user_id
      t.integer :subject_id
      t.integer :level_id

      t.timestamps null: false
    end
  end
end
