class BookTicketWorker
  include Sidekiq::Worker
  sidekiq_options :retry => 5

  def perform(reservation_id)
    reservation = Reservation.find(reservation_id)
    bot = BotBooking.new(reservation)
    bot.flow
  end
end
