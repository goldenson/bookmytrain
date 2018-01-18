set :output, "/home/deploy/cron.log"

every 1.day, :at => '11:00 pm' do
  rake "automated_reservation"
end

every :sunday, at: '11pm' do
  rake "weekly_reservation"
end