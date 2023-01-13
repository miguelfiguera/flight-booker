class UpdownBookingsAndPassengers < ActiveRecord::Migration[7.0]
  def up
      add_column :bookings, :flight_id,:integer
      add_column :bookings, :passenger_id, :integer
      add_column :passengers, :name, :string
      add_column :passengers, :booking_id, :integer
      add_column :passengers, :email, :string
  end

  def down
    remove_column :bookings, :flight_id
    remove_column :bookings, :passenger_id
    remove_column :passengers, :name
    remove_column :passengers, :booking_id
  end
end
