class AddingPassangersNumber < ActiveRecord::Migration[7.0]
  def change
    add_column :flights, :passenger_number,:integer
  end
end
