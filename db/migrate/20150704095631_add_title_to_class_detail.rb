class AddTitleToClassDetail < ActiveRecord::Migration
  def change
    add_column :class_details, :title, :string
  end
end
