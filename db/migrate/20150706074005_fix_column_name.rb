class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :class_times, :tc_id, :cd_id
  end
end
