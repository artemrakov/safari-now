class SafariImage < ApplicationRecord
  belongs_to :safari
  mount_uploader :photo, PhotoUploader
end
