class Safari < ApplicationRecord
  mount_uploaders :photos, PhotoUploader
  has_many :bookings
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
