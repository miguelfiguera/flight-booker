class Booking < ApplicationRecord
    belongs_to :passenger, inverse_of: :bookings
    belongs_to :flight, foreign_key: 'flight_id', inverse_of: :bookings

    accepts_nested_attributes_for :passenger
end
