include SeedHelper

User.create(first_name: 'a', last_name: 'a', last_name: 'a@a.com', username: 'a', password_digest: 'a')
# seed real legislators
SeedHelper::LegislatorSeed::insert_basic_legislators
SeedHelper::LegislatorSeed::insert_details
SeedHelper::LegislatorSeed::insert_image_url
SeedHelper::AlgorithmData::create_issues(KEYWORDS)
SeedHelper::AlgorithmData::seed_algorithm_data

# Uncomment if you would like fake content.

# seed fake legislators
100.times do
  Legislator.create(bioguide_id: Faker::Company.ein, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

# seed users

# 50.times do
#   User.create(first_name: Faker::Name.name, last_name: Faker::Name.name, email: Faker::Internet.safe_email, username: Faker::Internet.user_name, password:'a', about: Faker::Company.catch_phrase, city: Faker::Address.city, state: Faker::Address.state )
# end

# define universe of issues and positions
# issue_positions = {
#   "Immigration" => ["nativism", "open immigration", "more open borders", "more closed borders"],
#   "Healthcare" => ["universal health care", "publicly-funded health care", "two-tier health care"],
#   "Minimum Wage" => ["indexing to inflation", "raising the minimum wage", "lowering the minimum wage"],
#   "Personal Income Taxation" => ["progressive taxation", "regressive taxation", "proportional taxation"],
#   "Government Surveillance" => ["allowing collection of 'meta-data'", "allowing unrestricted surveillance so long as it's tied to the purpose of national security", "disallowing the government from collecting 'meta-data'", "disallowing all covert surveillance on any U.S. citizen"
#   ]
# }

# seed issues and positions

# seed stances, upvotes


# seed donations

# seed legislator_issues
# issue_positions.each do |issue, position_array|
#   new_issue = Issue.create(description: issue)
#   position_array.each { |position| new_issue.positions.create(description: position) }
# end

# # seed stances, upvotes
# User.all.each do |user|
#   50.times { user.stances.create(position_id: rand(Position.count) + 1) }
# end

# Stance.all.each do |stance|
#   rand(50).times do
#     stance.legislator_stances.create(legislator_id: (1 + rand(Legislator.count)))
#     stance.upvotes.create(user_id: (1 + rand(User.count))
#   end
# end

# # seed donations
# User.all.each do |user|
#   user.donations.create(legislator_id: (1 + rand(Legislator.count)), stance_id: (1 + rand(Stance.count)), amount: rand(1000000))
# end

# # seed legislator_issues
# 1000.times do
#   LegislatorIssue.create(issue_id: (1 + rand(Issue.count)),legislator_id: (1 + rand(Legislator.count)), issue_score: 0.5)
# end
