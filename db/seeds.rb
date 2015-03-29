# seed users
5.times do
  User.create!(first_name: Faker::Name.name, last_name: Faker::Name.name, email: Faker::Internet.safe_email, username: Faker::Internet.user_name, password:'a', about: Faker::Company.catch_phrase, city: Faker::Address.city, state: Faker::Address.state)
end