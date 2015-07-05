class AddSalaryToClassDetail < ActiveRecord::Migration
  def change
    add_column :class_details, :salary, :decimal
  end
end
