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

other_airports=airport.reverse


