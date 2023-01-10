class Airport < ApplicationRecord
    has_many :departing_flight, class_name:'Flight', foreign_key: 'flight_id'
    has_many :arrival_flight, class_name: 'Flight', foreign_key: 'flight_id'
end
