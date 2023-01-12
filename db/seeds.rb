# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

airlines=[
'Copacabana',
'american nolines',
'USS Enterprise',
'Klingon CuliVacation',
'Lol of the Rings',
'Tsunamis',
'BadLanding Airlines'
]

codes=[{code:'NYC'},{code:'CCS'},{code:'BOG'},{code:'LUM'},{code:'RAY'},{code:'BONNIE'},{code:'ROTTEN'},{code:'SAP'}]

airports=[]
codes.each do |c|
    airport=Airport.create(c)
    airport.save
    airports<<airport
end

def timing
    result=[]
    t1=Time.now.to_i
    t2=Time.new(2023,2,2).to_i
    result<<Time.at(rand(t1..t2))
    until result.length == 2
    lol=Time.at(rand(t1..t2))
    result<< lol if lol>result[0]
    end
    return result
end

other_airports=airports.reverse
i=0

25.times do
    arr=timing
    a=rand(8)
    b= rand(8)  
    Flight.create(
        departure_airport: airports[a],
        arrival_airport: other_airports[b],
        departure_time:arr[0],
        airline: airlines.sample,
        flight_number:rand(1000),
        duration: arr[1],
        passenger_number: rand(32)
    )
end
