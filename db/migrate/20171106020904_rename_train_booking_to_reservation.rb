class RenameTrainBookingToReservation < ActiveRecord::Migration[5.1]
  def change
    rename_table 'train_bookings', 'reservations'
  end
end
