set :output, "/home/deploy/cron.log"

every 1.day, :at => '11:00 pm' do
  rake "automated_reservation"
end