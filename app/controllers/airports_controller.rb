class AirportsController < ApplicationController
    def new
        @airport=Airport.new 
    end

    def index 
        @airports=Airport.all 
    end

    def create 
        @airport=Airport.new(airport_params)
    end

    private 
    def airport_params 
        params.require(:airport).permit(:code)
    end
end
