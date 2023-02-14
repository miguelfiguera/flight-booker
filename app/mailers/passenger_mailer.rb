class PassengerMailer < ApplicationMailer
    default from: 'gaticuspeticus@gmail.com'

    def confirmation_email
        @booking=Booking.find(params[:booking_id])
        @url=booking_url(@booking)
        @flight=Flight.find(@booking.flight_id)
        @passenger=Passenger.find_by(booking_id: @booking.id)
        mail(to: @passenger.email,
                subject: "Thank you booking flight #{@booking.flight.flight_number}!")
    end
end
