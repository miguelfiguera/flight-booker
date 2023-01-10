class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.integer :departure_id
      t.integer :arrival_id
      t.datetime :departure_time
      t.datetime :duration
      t.string :airline
      t.integer :flight_number
      t.timestamps
    end
  end
end
