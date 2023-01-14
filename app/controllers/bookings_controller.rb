class BookingsController < ApplicationController
    def new
        @booking = Booking.new
        @flight = Flight.find(params[:flight_id])
    end

    def create
        @flight = Flight.find_by(booking_params[:flight_id])
        @booking =@flight.bookings.build(booking_params)

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
        params.require(:booking).permit(:passengers,:flight_id,passengers_attributes: [:name,:passenger_id, :email])
    end

end
