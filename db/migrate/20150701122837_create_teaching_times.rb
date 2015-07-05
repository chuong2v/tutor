class CreateTeachingTimes < ActiveRecord::Migration
  def change
    create_table :teaching_times do |t|
      t.integer :td_id
      t.integer :dow_id
      t.integer :tod_id

      t.timestamps null: false
    end
  end
end
