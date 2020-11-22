# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

carpark1 = Carpark.where(name: 'Guildford Park Carpark').first
carpark1.destroy if carpark1
Carpark.create([name: 'Guildford Park Carpark', address: '122 Guildford Park Ave, Guildford, GU2 7NN'])
carpark1 = Carpark.where(name: 'Guildford Park Carpark').first

carpark2 = Carpark.where(name: 'Bedford Road Car Park').first
carpark2.destroy if carpark2
Carpark.create([name: 'Bedford Road Car Park', address: '45 Bedford Road, Guildford, GU1 4SJ'])
carpark2 = Carpark.where(name: 'Bedford Road Car Park').first

carpark3 = Carpark.where(name: 'University of Surrey Public Car Park').first
carpark3.destroy if carpark3
Carpark.create([name: 'University of Surrey Public Car Park', address: 'Perimeter Road, Guildford, GU2 7JL'])
carpark3 = Carpark.where(name: 'University of Surrey Public Car Park').first

Space.delete_all
(1..10).each do |i|
  Space.create(carpark: carpark1, space_number: i, hourly_cost: 1.50)
end

(1..10).each do |i|
  Space.create(carpark: carpark2, space_number: i, hourly_cost: 2)
end

(1..10).each do |i|
  Space.create(carpark: carpark3, space_number: i, hourly_cost: 1.75)
end
