class Airport < ApplicationRecord
    has_many :departing, class_name:'Flight', foreign_key: 'flight_id'
    has_many :arriving, class_name: 'Flight', foreign_key: 'flight_id'
end
