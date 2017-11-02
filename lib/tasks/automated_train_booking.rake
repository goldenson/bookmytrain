desc 'Book a train for Millie on trainline.fr'
task automated_train_booking: :environment do
  reservation = BotBooking.new
  reservation.flow
  sleep 1
end
