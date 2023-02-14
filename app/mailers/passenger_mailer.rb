class PassengerMailer < ApplicationMailer
    default from: 'gaticuspeticus@gmail.com'

    def confirmation_email
        @booking=Booking.find(params[:booking_id])
        @url=booking_url(@booking)
        mail(to: @booking.passenger.pluck(:email),
                subject: "Thank you booking flight #{@booking.flight.flight_number}!")
    end

    
    end
end
