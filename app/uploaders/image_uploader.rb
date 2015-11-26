# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick #this is for thumbnails

  storage :file

  def store_dir #we can change storage directory (this is default one)
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

   version :thumb do
    process :resize_to_fill => [100, 100]
  end

  def extension_white_list #regular expression for allowing only jpg, jpeg and png files to be uploaded
    %w(jpg jpeg png)
  end


end
