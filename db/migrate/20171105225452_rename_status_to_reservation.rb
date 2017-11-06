class RenameStatusToReservation < ActiveRecord::Migration[5.1]
  def change
    rename_column :train_bookings, :status, :state
    change_column_default :train_bookings, :state, 'pending'
  end
end
