class TrainBooking < ApplicationRecord
  validates :city_departure, presence: true
  validates :city_arrival, presence: true
  validates :date_departure, presence: true
  validates :time_departure, presence: true

  before_save :sanitize_cities

  private

  def sanitize_cities
    self.city_departure = self.city_departure.split(',').first
    self.city_arrival = self.city_arrival.split(',').first
  end
end
