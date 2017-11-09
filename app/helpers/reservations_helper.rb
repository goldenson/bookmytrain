module ReservationsHelper
  def display_status_badge_html(reservation)
    if reservation.successful?
      "<span class='badge badge-pill badge-success'>Réservé</span>".html_safe
    elsif reservation.failed?
      "<span class='badge badge-pill badge-danger'>Erreur</span>".html_safe
    else
      "<span class='badge badge-pill badge-info'>Pas Réservé</span>".html_safe
    end
  end
end
