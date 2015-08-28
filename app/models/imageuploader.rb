require 'carrierwave/datamapper'
require 'carrierwave'

class ImageUploader < CarrierWave::Uploader::Base
  def store_dir
    "app/public/images"
  end

  storage :file
end
