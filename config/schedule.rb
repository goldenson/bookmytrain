set :chronic_options, :hours24 => true

every 1.day, :at => '01:00' do
  rake "automated_train_booking"
end
