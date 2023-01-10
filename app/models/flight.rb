class Flight < ApplicationRecord
    has_one :arrival_airport, class_name: 'Airport', foreign_key: 'airport_id'
    has_one :departure_airport, class_name:'Airport', foreign_key: 'airport_id'
end
