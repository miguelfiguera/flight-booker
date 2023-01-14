https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker

Este fue un proyecto dificil:

Problema 1) Mandar una 'form' de busqueda a la misma Url usando get para obtener resultados.

solucion: crear (en la pagina donde lo estuvieras haciendo) una variable que permitiera obtener todos los resultados.

problema 2) las fechas y su criterio de busqueda....


solucion: tuve que usar plucked, crear un metodo en el modelo para los parametros de busqueda y para la fecha con un formato mas sencillo.

        @dates=Flight.all.pluck(:departure_time).sort{|a,b|a<=>b}.uniq

esto fue lo que me permitio que aparecieran como yo queria y necesitaba.

problema 3) crear una forma para los resultados que me mandase con un radio_button a la pagina newBookings.

solucion    
     <%=form_with(model: @flight, url:          new_booking_path, method: :get) do |form|%>

     y tambien entra el final del radio button para mandar el id que necesitaba    
          <%=form.radio_button :flight_id, fly.id%>

Problema 4) No se creaba el booking por diversas razones y errores: 

a)
ActionController::ParameterMissing (param is missing or the value is empty: booking):

solucion: era un problema en los metodos y/o variables del def new de booking.


b)
Completed 404 Not Found in 7ms (ActiveRecord: 0.2ms | Allocations: 4793)



ActiveRecord::RecordNotFound (Couldn't find Flight without an ID):


fue necesario cambiar las asociaciones:

has_many de passenger a belongs_to con respecto a booking

belongs_to de bookings a has_many con respecto a passengers

corregir los inversos y EUREKA!


problema 5) es necesario colocar el builder en def new de booking para que aparezca la 'form' necesaria para crear a los pasajeros: 

        @booking.passengers.build ##This is necessary for the passengers form to be created.

problema 6) realmente como el tercero pero ahorita fue que lo recorde:

en create, cuando se define otra variable distinta a la que uno tiene en new, debes usar los parametros definidos en el metodo privado de la clase y seleccionar el especifico a usar para la busqueda: 
        def create
        @flight = Flight.find_by(booking_params[:flight_id])
        @booking =@flight.bookings.build(booking_params)

        if @booking.save
            redirect_to root_path
        else
            render new
        end
    end


   private



    def booking_params
        params.require(:booking).permit(:passengers,:flight_id,passengers_attributes: [:name,:passenger_id, :email])
    end


En general ha sido un ejercicio complicado pero que me ha permitido entender mejor las relaciones entre los distintos elementos de rails... No hace que me guste mas, pero me alegra haber sido capaz despues de tanto esfuerzo.

