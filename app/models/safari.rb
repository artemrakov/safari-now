class Safari < ApplicationRecord
  has_many :safari_images
  has_many :bookings
  belongs_to :user
  geocoded_by :address
  accepts_nested_attributes_for :safari_images
  after_validation :geocode, if: :address_changed?
end
