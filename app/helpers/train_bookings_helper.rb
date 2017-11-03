module TrainBookingsHelper
  def humanize_seat_preference(reservation)
    BotBooking::SEAT_PREFERENCES[reservation.seat_preference.to_i].first
  end
end
