class TrainBooking < ApplicationRecord
  validates :city_departure, presence: true
  validates :city_arrival, presence: true
  validates :date_departure, presence: true
  validates :time_departure, presence: true
end
