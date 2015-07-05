class RemoveSubjectIdFromTutorDetail < ActiveRecord::Migration
  def change
    remove_column :tutor_details, :subject_id, :integer
  end
end
