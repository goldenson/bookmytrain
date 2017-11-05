class AddStatusToReservation < ActiveRecord::Migration[5.1]
  def change
    add_column :train_bookings, :status, :string
  end
end
