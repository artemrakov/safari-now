class Safari < ApplicationRecord
  mount_uploader :photos, PhotoUploader
  has_many :bookings
  belongs_to :user
end
