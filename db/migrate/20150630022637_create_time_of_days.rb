class CreateTimeOfDays < ActiveRecord::Migration
  def change
    create_table :time_of_days do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
