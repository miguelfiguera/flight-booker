class AddingBookingIdToPassengers < ActiveRecord::Migration[7.0]
  def up
    add_column :passengers, :booking_id,:integer
  end

  def down
    remove_column :passengers, :booking_id
  end
  

end
