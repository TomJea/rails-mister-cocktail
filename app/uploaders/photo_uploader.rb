# encoding: utf-8
class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true

  process convert: 'jpg'

  version :standard do
    resize_to_fit 600, 400
  end

  version :size_index do
    cloudinary_transformation effect: "brightness:30", width: 100, height: 200, crop: :scale
  end

  version :size_show do
    cloudinary_transformation effect: "brightness:30", width: 200, height: 400, crop: :scale
  end
end
