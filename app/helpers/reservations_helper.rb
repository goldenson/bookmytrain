module ReservationsHelper
  def humanize_seat_preference(reservation)
    BotBooking::SEAT_PREFERENCES[reservation.seat_preference.to_i].first
  end

  def display_status_badge_html(reservation)
    if reservation.successful?
      "<span class='badge badge-pill badge-success'>Réservé</span>".html_safe
    else
      "<span class='badge badge-pill badge-info'>Pas Réservé</span>".html_safe
    end
  end
end
