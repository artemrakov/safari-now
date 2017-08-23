class Safari < ApplicationRecord
  mount_uploaders :photos, PhotoUploader
  has_many :bookings
  belongs_to :user
end
