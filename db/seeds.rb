include SeedHelper

SeedHelper::LegislatorSeed::insert_basic_legislators
SeedHelper::LegislatorSeed::insert_details
SeedHelper::LegislatorSeed::insert_image_url

# seed users
50.times do
  User.create(first_name: Faker::Name.name, last_name: Faker::Name.name, email: Faker::Internet.safe_email, username: Faker::Internet.user_name, password:'a', about: Faker::Company.catch_phrase, city: Faker::Address.city, state: Faker::Address.state )
end

# define universe of issues and positions
issue_positions = {
  "Immigration" => ["nativism", "open immigration", "more open borders", "more closed borders"],
  "Healthcare" => ["universal health care", "publicly-funded health care", "two-tier health care"],
  "Minimum Wage" => ["indexing to inflation", "raising the minimum wage", "lowering the minimum wage"],
  "Personal Income Taxation" => ["progressive taxation", "regressive taxation", "proportional taxation"],
  "Government Surveillance" => ["allowing collection of 'meta-data'", "allowing unrestricted surveillance so long as it's tied to the purpose of national security", "disallowing the government from collecting 'meta-data'", "disallowing all covert surveillance on any U.S. citizen"
  ]
}

# seed issues and positions
issue_positions.each do |issue, position_array|
  new_issue = Issue.create(description: issue)
  position_array.each { |position| new_issue.positions.create(description: position) }
end

# seed stances
500.times { User.all.each { |user| user.stances.create(position_id: rand(Position.count) + 1) } }
Stance.all.each do |stance|
  (5 + rand(10)).times { stance.legislators << Legislator.find(1 + rand(Legislator.count)) }
end

# seed upvotes
500.times do
  Upvote.create(user_id: (1 + rand(User.count)), stance_id: (1 + rand(Stance.count)))
end


# seed donations
User.all.each do |user|
  user.donations.create(legislator_id: (1 + rand(Legislator.count)), stance_id: (1 + rand(Stance.count)), amount: rand(1000000))
end