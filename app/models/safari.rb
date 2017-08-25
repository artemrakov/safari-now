class Safari < ApplicationRecord
  has_many :safari_images
  has_many :bookings
  has_many :reviews
  belongs_to :user
  geocoded_by :address
  accepts_nested_attributes_for :safari_images
  after_validation :geocode, if: :address_changed?


  def has_been_booked?(user)
    self.bookings.include? user.bookings.where(safari: self).first
  end
end
