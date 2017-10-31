class CreateTrainBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :train_bookings do |t|
      t.string :from
      t.string :to
      t.date :date_from
      t.date :date_to
      t.time :time_from
      t.time :time_to

      t.timestamps
    end
  end
end
