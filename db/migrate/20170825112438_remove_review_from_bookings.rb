class RemoveReviewFromBookings < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :review, :text
  end
end
