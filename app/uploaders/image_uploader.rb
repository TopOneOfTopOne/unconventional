class ImageUploader < CarrierWave::Uploader::Base
include Cloudinary::CarrierWave

  process resize_to_fill: [300,300]

  version :thumb do
    process resize_to_fit: [50, 50]
  end

  version :large do
    process resize_to_fit: [200,200]
  end

  version :circle do
    cloudinary_transformation format: :png, transformation: [
      {effect: :improve},
      {width: 300, height: 300, crop: :thumb, gravity: :face, radius: :max}
    ]
  end

  def extension_white_list
      %w(jpg jpeg gif png webm mp4 ogv)
  end

  def default_public_id
    'sample'
  end
end
