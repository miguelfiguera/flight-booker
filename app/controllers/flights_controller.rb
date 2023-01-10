class FlightsController < ApplicationController
    def index
        @flights=Flight.all
    end

    def new
        @flight=Flight.new
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
