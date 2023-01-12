class Airport < ApplicationRecord
    has_many :departing_flights, class_name:'Flight', foreign_key: 'departure_id',inverse_of: :departure_airport
    has_many :arriving_flights, class_name: 'Flight', foreign_key: 'arrival_id', inverse_of: :arrival_airport

    validates :code, uniqueness: true
end
