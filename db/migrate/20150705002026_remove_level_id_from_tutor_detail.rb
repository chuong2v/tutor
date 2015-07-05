class RemoveLevelIdFromTutorDetail < ActiveRecord::Migration
  def change
    remove_column :tutor_details, :level_id, :integer
  end
end
