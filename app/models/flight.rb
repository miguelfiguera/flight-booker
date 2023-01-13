class Flight < ApplicationRecord
    belongs_to :departure_airport, class_name: 'Airport', foreign_key: 'departure_id',inverse_of: :departing_flights
    belongs_to :arrival_airport, class_name:'Airport', foreign_key: 'arrival_id',inverse_of: :arriving_flights
    has_many :bookings
    has_many :passengers, through: :bookings

    def self.user_search(search_params)
        where(departure_id: search_params[:departure_id],
               arrival_id: search_params[:arrival_id],
               departure_time: search_params[:departure_time]
            )
    end

    def date_formatted
        departure_time.strftime("%d/%m/%Y")
    end

end
