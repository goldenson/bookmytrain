class AddDefaultSeatToReservation < ActiveRecord::Migration[5.1]
  def change
    change_column_default :reservations, :seat_preference, 'Couloir'
  end
end
