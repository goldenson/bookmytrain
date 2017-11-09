class AddCounterCacherToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :reservations_count, :integer, default: 0
  end
end
