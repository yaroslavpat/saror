class AnalyzerFile < ActiveRecord::Base
  mount_uploader :file, FileUploader
end
