class FileUploader < CarrierWave::Uploader::Base
  def store_dir
    'files'
  end
end