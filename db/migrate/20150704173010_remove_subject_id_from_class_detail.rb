class RemoveSubjectIdFromClassDetail < ActiveRecord::Migration
  def change
    remove_column :class_details, :subject_id, :integer
  end
end
