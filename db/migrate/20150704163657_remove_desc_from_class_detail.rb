class RemoveDescFromClassDetail < ActiveRecord::Migration
  def change
    remove_column :class_details, :desc, :string
  end
end
