class RemoveStatusFromBooking < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :status
  end
end
