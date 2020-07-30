Favorite.destroy_all
User.destroy_all
Pet.destroy_all
Location.destroy_all

require 'csv'




20.times do
User.create(name: Faker::Name.name, password: rand(123456..6123456).to_s, email:Faker::Internet.email)
end

locations = ["Manhattan", "Brooklyn", "Queens", "Staten Island", "Bronx", "New Jersey", "Long Island"]


7.times do
Location.create(name: locations.sample, address: Faker::Address.street_address, phone: rand(1234567890..9234567899))
end


csv_text = File.read(Rails.root.join('lib', 'seeds', 'pets.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.first(21).each do |row|
  p = Pet.find_or_initialize_by(name: row['Raw_Name'].split(',').first )
  p.breed = row['Breed']
  p.age = row['Age']
  p.location = Location.all.sample
  p.animal_type = row['AnimalType']
  byebug
  p.save
end


# 40.times do
# Pet.create(name:Faker::Creature::Cat.name, age: rand(0..15), animal_type: Faker::Creature::Animal.name, breed: Faker::Creature::Dog.breed, img_url: "https://www.mercurynews.com/wp-content/uploads/2019/01/GettyImages-531306536.jpg", location_id: Location.all.sample.id)
# end

20.times do
Favorite.create(user_id: User.all.sample.id, pet_id: Pet.all.sample.id)
end


