class BookingsController < ApplicationController
    def new
        @flight=Flight.find(params[:flight_id])
        @booking=Booking.new
        @passenger=Passenger.new
    end

    def create
        @flight = Flight.find(booking_params[:flight_id])
        @booking = @flight.bookings.build(booking_params)
        
        if @booking.save
            redirect_to root_path
        else
            render new
        end
    end

    def index
        @bookings=Booking.all
    end

    def show
        @booking=Booking.find(params[:id])
    end

    private



    def booking_params
        params.require(:booking).permit(:flight_id,passengers_attributes: [:name, :email])
    end

end
