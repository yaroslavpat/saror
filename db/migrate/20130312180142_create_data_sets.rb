class CreateDataSets < ActiveRecord::Migration
  def change
    create_table :data_sets do |t|
      t.text :data, :null => false

      t.timestamps
    end
  end
end
