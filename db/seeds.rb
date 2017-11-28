# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do 
  User.create(first_name: "#{('a'..'z').to_a.shuffle[0,8].join}", last_name: "#{('a'..'z').to_a.shuffle[0,8].join}")
end 

count = 0
while count < User.count 
  count += 1
  TeamPlay.create(name: "#{('a'..'z').to_a.shuffle[0,8].join}", user_id: count, teammate_id: (count += 1))
end 

