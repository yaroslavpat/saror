class CreateAnalyzerFiles < ActiveRecord::Migration
  def change
    create_table :analyzer_files do |t|
      t.timestamps
      t.string :file
    end
  end
end
