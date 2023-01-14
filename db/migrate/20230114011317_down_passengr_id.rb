class DownPassengrId < ActiveRecord::Migration[7.0]
  def up
    remove_column :bookings, :passenger_id
  end

  def down 
    add_column :bookings, :passenger_id, :integer
  end
  
end
