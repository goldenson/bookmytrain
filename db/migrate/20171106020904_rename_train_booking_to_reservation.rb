class RenameTrainBookingToReservation < ActiveRecord::Migration[5.1]
  def change
    rename_table 'reservations', 'reservations'
  end
end
