class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  version :bright_face do
    cloudinary_transformation effect: "brightness:10", radius: 20,
      width: 150, height: 150, crop: :thumb, gravity: :face
  end
end
