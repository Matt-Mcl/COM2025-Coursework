# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

carpark = Carpark.where(name: 'Guildford Park Carpark').first
carpark&.delete(carpark)
Carpark.create([name: 'Guildford Park Carpark', address: '122 Guildford Park Ave, Guildford, GU2 7NN'])

carpark = Carpark.where(name: 'Bedford Road Car Park').first
carpark&.delete(carpark)
Carpark.create([name: 'Bedford Road Car Park', address: '45 Bedford Road, Guildford, GU1 4SJ'])

carpark = Carpark.where(name: 'University of Surrey Public Car Park').first
carpark&.delete(carpark)
Carpark.create([name: 'University of Surrey Public Car Park', address: 'Perimeter Road, Guildford GU2 7JL'])

