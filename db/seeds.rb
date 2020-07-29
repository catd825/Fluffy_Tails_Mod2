Favorite.destroy_all
User.destroy_all
Pet.destroy_all
Location.destroy_all


20.times do
User.create(name: Faker::Name.name, password: rand(123456..6123456).to_s, email:Faker::Internet.email)
end

20.times do
Location.create(name: Faker::Address.city, address: Faker::Address.street_address, phone: rand(1234567890..9234567899))
end

20.times do
Pet.create(name:Faker::Creature::Dog.name, age: rand(0..15), animal_type: "Dog", breed: Faker::Creature::Dog.breed, img_url: "https://www.mercurynews.com/wp-content/uploads/2019/01/GettyImages-531306536.jpg", location_id: Location.all.sample.id)
end

20.times do
  Pet.create(name:Faker::Creature::Cat.name, age: rand(0..15), animal_type: "Cat", breed: Faker::Creature::Cat.breed, img_url: "https://media.wired.com/photos/5cdefc28b2569892c06b2ae4/master/w_2560%2Cc_limit/Culture-Grumpy-Cat-487386121-2.jpg", location_id: Location.all.sample.id)
end

20.times do
Favorite.create(user_id: User.all.sample.id, pet_id: Pet.all.sample.id)
end


