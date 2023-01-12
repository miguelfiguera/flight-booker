class FlightsController < ApplicationController
    def index
        ##collections
        @departures=Flight.all.map{|f|[f.departure_airport.code,f.departure_airport.id]}.sort{|a,b| a<=>b}.uniq
        @arrivals=Flight.all.map{|f|[f.arrival_airport.code,f.arrival_airport.id]}.sort{|a,b| a<=>b}.uniq
        @dates=Flight.all.pluck(:departure_time).sort{|a,b|a<=>b}.uniq
        ##----


        ##

        @search_results=Flight.user_search(search_params)

        
        
        @flights=Flight.all

    end

    def new
        @flight=Flight.new
    end

    def show
               
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
    def search_params
        params.permit(:departure_id,:arrival_id,:departure_time,:duration,:airline,:flight_number,:passenger_number,:commit)
    end

    def flight_params 
        params.require(:flight).permit([:id,:departure_id,:arrival_id,:duration,:departure_time,:flight_number])
    end
end

##Schema stuff


##create_table "flights", force: :cascade do |t|
  ##  t.integer "departure_id"
    ##t.integer "arrival_id"
    ##t.datetime "departure_time"
    ##t.datetime "duration"
    ##t.string "airline"
    ##t.integer "flight_number"
    ##t.datetime "created_at", null: false
    ##t.datetime "updated_at", null: false
    ##t.integer "passenger_number"
  ##end