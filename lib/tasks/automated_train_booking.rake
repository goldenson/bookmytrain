desc 'Book a train for Millie on trainline.fr'
task automated_train_booking: :environment do
  TrainBooking.unbooked.each do |reservation|
    bot = BotBooking.new(reservation)
    bot.flow
  end
end
