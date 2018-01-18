desc 'Create round trip reservation for the weekend'
task weekly_reservation: :environment do
  user = User.find_by(name: 'Millie')

  Reservation.create!(
    city_departure: 'Paris',
    city_arrival: 'Saint-Raphael',
    date_departure: Date.current + 1.months + 5.days,
    seat_preference: 'Couloir',
    time_departure: '18',
    user_id: user.id,
  )

  Reservation.create!(
    city_departure: 'Saint-Raphael',
    city_arrival: 'Paris',
    date_departure: Date.current + 1.months + 7.days,
    time_departure: '15',
    seat_preference: 'Couloir',
    user_id: user.id,
  )
end
