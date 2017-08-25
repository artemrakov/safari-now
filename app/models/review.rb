class Review < ApplicationRecord
  belongs_to :booking, dependent: :destroy
  belongs_to :safari, dependent: :destroy
end
