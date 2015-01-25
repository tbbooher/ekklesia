include SeedHelper

SeedHelper::LegislatorSeed::insert_basic_legislators
SeedHelper::LegislatorSeed::insert_details
SeedHelper::LegislatorSeed::insert_image_url


50.times do
  User.create(first_name: Faker::Name.name, last_name: Faker::Name.name, email: Faker::Internet.safe_email, username: Faker::Internet.user_name, password:'a')
end

issue_positions = {
  "Immigration" => ["nativism", "open immigration", "more open borders", "more closed borders"],
  "Healthcare" => ["universal health care", "publicly-funded health care", "two-tier health care"],
  "Minimum Wage" => ["indexing to inflation", "raising the minimum wage", "lowering the minimum wage"],
  "Personal Income Taxation" => ["progressive taxation", "regressive taxation", "proportional taxation"],
  "Government Surveillance" => ["allowing collection of 'meta-data'", "allowing unrestricted surveillance so long as it's tied to the purpose of national security", "disallowing the government from collecting 'meta-data'", "disallowing all covert surveillance on any U.S. citizen"
  ]
}

issue_positions.each do |issue, position_array|
  new_issue = Issue.create(description: issue)
  position_array.each { |position| new_issue.positions.create(description: position) }
end

Position.all.each do |position|
  position.stances.create(user_id: rand(User.all.count) + 1)
end

Stance.all.each do |stance|
  (1 + rand(10)).times { stance.legislators << Legislator.find(1 + rand(Legislator.count)) }
end

500.times do
  Upvote.create(user_id: (1 + rand(User.count)), stance_id: (1 + rand(Stance.count)))
end
