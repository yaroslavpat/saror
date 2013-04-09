class File < ActiveRecord::Base
  def uploaded_file=(file_field)
    self.name = base_part_of(file_field.original_filename)
    self.data = file_field.read
  end
  def base_part_of(file_name)
    File.basename(file_name).gsub(/[^\w._-]/, '')
  end
end