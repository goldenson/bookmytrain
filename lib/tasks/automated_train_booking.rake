desc 'Book a train for Millie on trainline.fr'
task automated_train_booking: :environment do
  automated_reservation = BotBooking.new
  automated_reservation.search_for_results
  sleep 10
end
