class CreateTutorSubjects < ActiveRecord::Migration
  def change
    create_table :tutor_subjects do |t|
      t.integer :subject_id
      t.integer :td_id

      t.timestamps null: false
    end
  end
end
