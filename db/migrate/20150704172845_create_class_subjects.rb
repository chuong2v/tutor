class CreateClassSubjects < ActiveRecord::Migration
  def change
    create_table :class_subjects do |t|
      t.integer :cd_id
      t.integer :subject_id

      t.timestamps null: false
    end
  end
end
