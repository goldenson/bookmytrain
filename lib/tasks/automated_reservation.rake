desc 'Book a train on trainline.fr'
task automated_reservation: :environment do
  Reservation.unbooked.each do |reservation|
    BookTicketWorker.perform_async(reservation.id)
  end
end
