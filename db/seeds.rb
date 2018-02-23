# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
trip1 = Trip.create!(name: "trip1", start_date: Date.today, end_date: Date.today)
trip2 = Trip.create!(name: "trip2", start_date: Date.today, end_date: Date.today)
trail1 = Trail.create!(length: 10, name: "trail1", address: "10 trail ln")
trail2 = Trail.create!(length: 20, name: "trail2", address: "20 trail ln")
trip1.trails << trail1
trip1.trails << trail2
