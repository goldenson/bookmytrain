require "administrate/base_dashboard"

class ReservationDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    id: Field::Number,
    city_departure: Field::String,
    city_arrival: Field::String,
    date_departure: Field::DateTime,
    time_departure: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    seat_preference: Field::String,
    state: Field::String,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :user,
    :id,
    :city_departure,
    :city_arrival,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :id,
    :city_departure,
    :city_arrival,
    :date_departure,
    :time_departure,
    :created_at,
    :updated_at,
    :seat_preference,
    :state,
  ].freeze

  FORM_ATTRIBUTES = [
    :user,
    :city_departure,
    :city_arrival,
    :date_departure,
    :time_departure,
    :seat_preference,
    :state,
  ].freeze
end
