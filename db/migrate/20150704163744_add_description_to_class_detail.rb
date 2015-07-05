class AddDescriptionToClassDetail < ActiveRecord::Migration
  def change
    add_column :class_details, :description, :string
  end
end
