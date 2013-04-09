class CreateFiles < ActiveRecord::Migration
  def change
    create_table :files do |t|
      t.string :name
      t.binary :data, :limit => 1.megabyte
    end
  end
end
