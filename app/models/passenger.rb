class Passenger < ApplicationRecord
    has_many :bookings, inverse_of: :passenger
    has_many :flights, through: :bookings
end
