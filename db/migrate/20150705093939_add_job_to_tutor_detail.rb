class AddJobToTutorDetail < ActiveRecord::Migration
  def change
    add_column :tutor_details, :job, :string
  end
end
