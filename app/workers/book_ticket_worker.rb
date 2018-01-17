class BookTicketWorker
  include Sidekiq::Worker
  sidekiq_options :retry => 5, :backtrace => 10

  def perform(reservation_id)
    reservation = Reservation.find(reservation_id)
    logger.info "Run bot booking........."
    bot = BotBooking.new(reservation)
    bot.flow
  end
end
