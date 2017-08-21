class User < ApplicationRecord
  has_many :bookings
  has_many :created_safaris, class_name: "Safari", foreign_key: :user_id
  has_many :booked_safaris, through: :bookings, source: :safari
  mount_uploader :avatar, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
