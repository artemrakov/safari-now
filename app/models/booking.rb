class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :safari
  has_many :reviews
end
