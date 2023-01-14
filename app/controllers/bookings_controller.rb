class BookingsController < ApplicationController
    def new
        @flight=Flight.find(params[:flight_id])
        @booking=Booking.new
        @booking.passenger.build(booking_params)
    end

    def create
        @booking=Booking.new(booking_params)
        
        if save
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
