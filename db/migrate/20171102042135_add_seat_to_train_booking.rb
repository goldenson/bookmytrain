class AddSeatToTrainBooking < ActiveRecord::Migration[5.1]
  def change
    add_column :train_bookings, :seat_preference, :string
  end
end
