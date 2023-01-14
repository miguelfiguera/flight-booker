class Booking < ApplicationRecord
    has_many :passengers, inverse_of: :booking
    belongs_to :flight, inverse_of: :bookings

    accepts_nested_attributes_for :passengers
end
