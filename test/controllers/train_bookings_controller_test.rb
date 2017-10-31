require 'test_helper'

class TrainBookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @train_booking = train_bookings(:one)
  end

  test "should get index" do
    get train_bookings_url
    assert_response :success
  end

  test "should get new" do
    get new_train_booking_url
    assert_response :success
  end

  test "should create train_booking" do
    assert_difference('TrainBooking.count') do
      post train_bookings_url, params: { train_booking: { date_from: @train_booking.date_from, date_to: @train_booking.date_to, from: @train_booking.from, time_from: @train_booking.time_from, time_to: @train_booking.time_to, to: @train_booking.to } }
    end

    assert_redirected_to train_booking_url(TrainBooking.last)
  end

  test "should show train_booking" do
    get train_booking_url(@train_booking)
    assert_response :success
  end

  test "should get edit" do
    get edit_train_booking_url(@train_booking)
    assert_response :success
  end

  test "should update train_booking" do
    patch train_booking_url(@train_booking), params: { train_booking: { date_from: @train_booking.date_from, date_to: @train_booking.date_to, from: @train_booking.from, time_from: @train_booking.time_from, time_to: @train_booking.time_to, to: @train_booking.to } }
    assert_redirected_to train_booking_url(@train_booking)
  end

  test "should destroy train_booking" do
    assert_difference('TrainBooking.count', -1) do
      delete train_booking_url(@train_booking)
    end

    assert_redirected_to train_bookings_url
  end
end
