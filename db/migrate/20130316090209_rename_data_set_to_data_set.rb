class RenameDataSetToDataSet < ActiveRecord::Migration
  def up
    rename_table :data_sets, :data_sets
  end

  def down
    rename_table :data_sets, :data_sets
  end
end
