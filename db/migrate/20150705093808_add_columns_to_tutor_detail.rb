class AddColumnsToTutorDetail < ActiveRecord::Migration
  def change
    add_column :tutor_details, :title, :string
    add_column :tutor_details, :address, :string
    add_column :tutor_details, :gender_id, :integer
    add_column :tutor_details, :description, :string
  end
end
