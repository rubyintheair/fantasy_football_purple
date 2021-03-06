# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: "Quy", last_name: "Nguyen", email: "quy.nguyenngoctp@gmail.com",
            password: "123", password_confirmation: "123")

#create Users
10.times do 
  User.create(
    first_name: Faker::HowIMetYourMother.character, 
    last_name: Faker::Book.author,
    email: Faker::Internet.email,
    password: "1234",
    password_confirmation: "1234"
    )
end 

#create TeamPlay
count = 0
while count < User.count 
  count += 1
  TeamPlay.create(
    name: Faker::Pokemon.name, 
    user_id: count, 
    teammate_id: (count += 1)
    )
end 

#create GameItems
count = 0
10.times do 
  # faker = Faker::Pokemon.move 
  count += 1
  GameItem.create(
    name: Faker::Pokemon.name + count.to_s, 
    question: Faker::HarryPotter.quote + count.to_s
    )
end 

#create Matches
count = 0 
while count < TeamPlay.count 
  count += 1
  count_user = 0
  Match.create(
    user_id: TeamPlay.where(id: count).first.user.id,
    owner_team: TeamPlay.where(id: count).first, 
    guest_team: TeamPlay.where(id: count += 1).first  
    )
end  

#create Games
count = 0 
count_team_a = 0
while count < Match.count 
  count_team_a += 1
  count_team_b = count_team_a + 1
  count += 1
  game_1 = Game.create(match_id: count, game_item_id: rand(1..GameItem.count), owner_team_id: count_team_a, guest_team_id: count_team_b)
  game_2 = Game.create(match_id: count, game_item_id: rand(1..GameItem.count), owner_team_id: count_team_a, guest_team_id: count_team_b)
  game_3 = Game.create(match_id: count, game_item_id: rand(1..GameItem.count), owner_team_id: count_team_a, guest_team_id: count_team_b)
end 




