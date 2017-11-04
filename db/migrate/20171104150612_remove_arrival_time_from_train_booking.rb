class RemoveArrivalTimeFromTrainBooking < ActiveRecord::Migration[5.1]
  def change
    remove_column :train_bookings, :date_arrival
    remove_column :train_bookings, :time_arrival
  end
end
