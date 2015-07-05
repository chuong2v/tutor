class AddColumnsToClassDetail < ActiveRecord::Migration
  def change
    add_column :class_details, :address, :string
    add_column :class_details, :gender_id, :integer
    add_column :class_details, :desc, :string
  end
end
