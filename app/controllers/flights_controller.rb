class FlightsController < ApplicationController
    def index

        @departures=Flight.all.map{|f|[f.departure_airport.code]}.uniq
        @arrivals=Flight.all.map{|f|[f.arrival_airport.code]}.uniq
        @dates=Flight.all.map{|d| [d.departure_time.strftime("%d/%m/%Y")]}
        @flights=Flight.all

    end

    def new
        @flight=Flight.new
    end

    def show
        @departures=Flight.all.map{|f|[f.departure_airport.code,f.departure_airport.id]}
        @arrivals=Flight.all.map{|f|[f.arrival_airport.code,f.arrival_airport.id]}
        @dates=Flight.all.map{|d| [d.departure_time]}

        @flight=Flight.find(params[:id])
    end

    def create 
        @flight=Flight.new(flight_params)
        if save
            redirect_to root_path
        else
            render new
        end
    end



    private


    def flight_params 
        params.require(:flight).permit([:id,:departure_id,:arrival_id,:duration,:departure_time,:flight_number])
    end
end
