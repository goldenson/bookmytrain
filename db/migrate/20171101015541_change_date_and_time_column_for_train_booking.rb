class ChangeDateAndTimeColumnForTrainBooking < ActiveRecord::Migration[5.1]
  def change
     rename_column :train_bookings, :date_from, :date_departure
     rename_column :train_bookings, :date_to, :date_arrival
     rename_column :train_bookings, :time_from, :time_departure
     rename_column :train_bookings, :time_to, :time_arrival
     rename_column :train_bookings, :from, :city_departure
     rename_column :train_bookings, :to, :city_arrival
  end
end
