desc 'Book a train on trainline.fr'
task automated_reservation: :environment do
  Reservation.unbooked.each do |reservation|
    bot = BotBooking.new(reservation)
    bot.flow
    # BookTicketWorker.perform_async(reservation.id)
  end
end
