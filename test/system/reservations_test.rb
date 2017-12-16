require "application_system_test_case"

class ReservationsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:max)
    sign_in @user
  end
  
  test "visiting the index" do
    visit reservations_url

    assert_selector "h2", text: "Réservations"
  end
end
