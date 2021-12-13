# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

OwnedSeeds.destroy_all()
OwnedFlowers.destroy_all()
PlotSlot.destroy_all()
CustomerRequest.destroy_all()
UserProfile.destroy_all()
FlowerType.destroy_all()

ashley = UserProfile.create!(user_name: 'Ashley', sun_penny: 100, last_update: DateTime.new(2021,12,10).to_time, plot_size: 3)

crocus = FlowerType.create!(name: 'Crocus', color: 'purple', growth_duration_seconds: 100, buy_price: 5, sell_price: 8, max_water_interval: 80, harvest_duration_seconds: 600, graphic: '/crocus.png')
petunia = FlowerType.create!(name: 'Petunia', color: 'white', growth_duration_seconds: 60, buy_price: 1, sell_price: 3, max_water_interval: 40, harvest_duration_seconds: 600, graphic: '/petunia.png')
tulip = FlowerType.create!(name: 'Tulip', color: 'red', growth_duration_seconds: 80, buy_price: 14, sell_price: 20, max_water_interval: 60, harvest_duration_seconds: 600, graphic: '/tulip.png')

crocus_seed = OwnedSeeds.create!(user_profile: ashley, flower_type: crocus, quantity: 1)
petunia_seed = OwnedSeeds.create!(user_profile: ashley, flower_type: petunia, quantity: 1)
tulip_seed = OwnedSeeds.create!(user_profile: ashley, flower_type: tulip, quantity: 1)

crocus_flower = OwnedFlowers.create!(user_profile: ashley, flower_type: crocus, quantity: 1)
petunia_flower = OwnedFlowers.create!(user_profile: ashley, flower_type: petunia, quantity: 1)
tulip_flower = OwnedFlowers.create!(user_profile: ashley, flower_type: tulip, quantity: 1)

plot1 = PlotSlot.create!(user_profile: ashley, x: 0, y: 0, flower_type: crocus, when_planted: DateTime.new(2021,12,10,0,3,0).to_time, when_watered: DateTime.new(2021,12,10,0,4,0).to_time)
plot2 = PlotSlot.create!(user_profile: ashley, x: 1, y: 0, flower_type: petunia, when_planted: DateTime.new(2021,12,10,0,3,15).to_time, when_watered: DateTime.new(2021,12,10,0,4,15).to_time)
plot3 = PlotSlot.create!(user_profile: ashley, x: 2, y: 0, flower_type: tulip, when_planted: DateTime.new(2021,12,10,0,3,30).to_time, when_watered: DateTime.new(2021,12,10,0,4,30).to_time)
plot7 = PlotSlot.create!(user_profile: ashley, x: 0, y: 2, flower_type: petunia, when_planted: DateTime.new(2021,12,10,0,3,45).to_time, when_watered: DateTime.new(2021,12,10,0,4,45).to_time)

onecrocus = CustomerRequest.create!(user_profile: ashley, flower_type: crocus, quantity: 1)
fourpetunias = CustomerRequest.create!(user_profile: ashley, flower_type: petunia, quantity: 4)
twotulips = CustomerRequest.create!(user_profile: ashley, flower_type: tulip, quantity: 2)
