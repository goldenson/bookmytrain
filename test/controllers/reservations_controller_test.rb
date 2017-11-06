require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservation = reservations(:one)
  end

  test "should get index" do
    get reservations_url
    assert_response :success
  end

  test "should get new" do
    get new_reservation_url
    assert_response :success
  end

  test "should create reservation" do
    assert_difference('Reservation.count') do
      post reservations_url, params: { reservation: { city_departure: @reservation.city_departure, city_arrival: @reservation.city_arrival, date_departure: @reservation.date_departure, time_departure: @reservation.time_departure, seat_preference: @reservation.seat_preference } }
    end

    assert_redirected_to reservations_path
  end

  test "should get edit" do
    get edit_reservation_url(@reservation)
    assert_response :success
  end

  test "should update reservation" do
    patch reservation_url(@reservation), params: { reservation: { city_departure: @reservation.city_departure, city_arrival: @reservation.city_arrival, date_departure: @reservation.date_departure, time_departure: @reservation.time_departure, seat_preference: @reservation.seat_preference } }
    assert_redirected_to reservations_path
  end

  test "should destroy reservation" do
    assert_difference('Reservation.count', -1) do
      delete reservation_url(@reservation)
    end

    assert_redirected_to reservations_url
  end
end
