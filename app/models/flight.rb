class Flight < ApplicationRecord
    has_one :departure_id, class_name: 'Airport', foreign_key: 'airport_id'
    has_one :arrival_id, class_name:'Airport', foreign_key: 'airport_id'
end
