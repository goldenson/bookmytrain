class AddUsersToReservations < ActiveRecord::Migration[5.1]
  def change
    add_reference :reservations, :user, foreign_key: true
  end
end
