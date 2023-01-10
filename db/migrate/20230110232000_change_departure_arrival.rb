class ChangeDepartureArrival < ActiveRecord::Migration[7.0]
  def change
    change_column :flights, :departure_id, :foreign_key
    change_column :flights, :arrival_id, :foreign_key
  end
end
