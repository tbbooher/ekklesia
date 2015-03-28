include SeedHelper
include AlgorithmHelper

# User.create(first_name: 'a', last_name: 'a', last_name: 'a@a.com', username: 'a', password_digest: 'a')
# # seed real legislators
# SeedHelper::LegislatorSeed::insert_basic_legislators
# SeedHelper::LegislatorSeed::insert_details
# SeedHelper::LegislatorSeed::insert_image_url
# SeedHelper::AlgorithmData::create_issues(KEYWORDS)
# SeedHelper::AlgorithmData::seed_algorithm_data
# AlgorithmHelper::set_stance_values_for_bills
# AlgorithmHelper::set_issue_score_for_legislators
# AlgorithmHelper::remove_incomplete_data_for_legislators

SeedHelper::BioScraper::get_all_biographies

# seed users
5.times do
  User.create!(first_name: Faker::Name.name, last_name: Faker::Name.name, email: Faker::Internet.safe_email, username: Faker::Internet.user_name, password:'a', about: Faker::Company.catch_phrase, city: Faker::Address.city, state: Faker::Address.state)
end

# define universe of issues and positions
<<<<<<< Updated upstream
# issue_positions = {
#   "abortion" => ["Pro-life", "Pro-choice", "Pro-life, except when woman's life is endangered", "Pro-life, except in the case of rape", "Pro-choice, through the first trimester", "Pro-choice, through the second trimester", "Pro-choice, through the third trimester"],
#   "economy" => ["Progressive taxation", "Regressive taxation", "Proportional taxation", "Indexing minimum wage to inflation", "Privatizing social security", "Cutting government spending", "Taxing wealthy Americans (the 'Buffet Rule')", "Cutting taxes", "Minimizing national debt as a priority"],
#   "education" => ["Standardized Testing", "Increasing standards for teacher training", "Instituting merit pay for teachers", "Private school vouchers"],
#   "energy" => ["Protecting Endangered Species", "Implementing emissions standards (e.g., carbon cap)", "Implementing Cap and Trade programs"],
#   "environment" => ["Protecting Endangered Species", "Implementing emissions standards (e.g., carbon cap)", "Implementing Cap and Trade programs"],
#   "finance" => ["Increasing banking regulation (e.g., Dodd-Frank)", "Relaxed financial sector regulations"],
#   "foreign policy" => ["Free trade", "Decreasing the defense budget", "Increasing the defense budget", "Increasing foreign aid", "Decreasing foreign aid"],
#   "gun control" => ["Required background checks for all firearm purchases", "Assault weapons ban", "Ammunication registration requirements", "High capacity magazine bans"],
#   "healthcare" => ["Expanding medicare expansion", "The Affordable Care Act", "Universal health care", "Publicly-funded health care", "Two-tiered health care", "Expanding medicaid"],
#   "immigration" => ["Providing amnesty for illegal immigrants under special cirumcstances", "Increasing Immigrants' Rights and Access to Services", "Strengthening US-Mexico border control", "The DREAM Act", "requiring employer E-verification", "establishing English as the official U.S. language"],
#   "jobs" => ["Granting job creation tax credits", "Increasing government infrastructure projects", "Cutting payroll taxes", "Increasing minimum wage", "Decreasing minimum wage"],
#   "welfare" => ["Increasing government welfare", "Decreasing government welfare"]
# }
=======
issue_positions = {
  "abortion" => ["Pro-life", "Pro-choice", "Pro-life, except when woman's life is endangered", "Pro-life, except in the case of rape", "Pro-choice, through the first trimester", "Pro-choice, through the second trimester", "Pro-choice, through the third trimester"],
  "economy" => ["Progressive taxation", "Regressive taxation", "Proportional taxation", "Indexing minimum wage to inflation", "Privatizing social security", "Cutting government spending", "Taxing wealthy Americans (the 'Buffet Rule')", "Cutting taxes", "Minimizing national debt as a priority"],
  "education" => ["Standardized Testing", "Increasing standards for teacher training", "Instituting merit pay for teachers", "Private school vouchers"],
  "energy" => ["Protecting Endangered Species", "Implementing emissions standards (e.g., carbon cap)", "Implementing Cap and Trade programs"],
  "environment" => ["Protecting Endangered Species", "Implementing emissions standards (e.g., carbon cap)", "Implementing Cap and Trade programs"],
  "finance" => ["Increasing banking regulation (e.g., Dodd-Frank)", "Relaxed financial sector regulations"],
  "foreign policy" => ["Free trade", "Decreasing the defense budget", "Increasing the defense budget", "Increasing foreign aid", "Decreasing foreign aid"],
  "gun control" => ["Required background checks for all firearm purchases", "Assault weapons ban", "Ammunication registration requirements", "High capacity magazine bans"],
  "healthcare" => ["Expanding medicare expansion", "The Affordable Care Act", "Universal health care", "Publicly-funded health care", "Two-tiered health care", "Expanding medicaid"],
  "immigration" => ["Providing amnesty for illegal immigrants under special cirumcstances", "Increasing Immigrants' Rights and Access to Services", "Strengthening US-Mexico border control", "The DREAM Act", "requiring employer E-verification", "establishing English as the official U.S. language"],
  "jobs" => ["Granting job creation tax credits", "Increasing government infrastructure projects", "Cutting payroll taxes", "Increasing minimum wage", "Decreasing minimum wage"],
  "welfare" => ["Increasing government welfare", "Decreasing government welfare"]
}
>>>>>>> Stashed changes

# # seed issues and positions
# issue_positions.each do |issue_name, position_array|
#   issue = Issue.where(description: issue_name)[0]
#   position_array.each { |position_description| issue.positions.create!(description: position_description) }
# end

<<<<<<< Updated upstream
# # seed stances, upvotes

# Position.all.each do |position|
#   position.stances.create!(user_id: (1 + rand(User.count)))
# end

# User.all.each do |user|
#   Stance.all.each do |stance|
#     rand(15).times do
#       stance.legislator_stances.create!(legislator_id: (1 + rand(Legislator.count)))
#     end
#     rand(2) == 0 ? stance.upvotes.create!(user_id: user.id) : nil
#   end
# end

# # seed donations
# Stance.all.each do |stance|
#   stance.donations.create!(legislator_id: (1 + rand(Legislator.count)), user_id: (1 + rand(User.count)), amount: rand(25..400))
# end
=======
# seed stances, upvotes

Position.all.each do |position|
  position.stances.create!(user_id: (1 + rand(User.count)))
end

User.all.each do |user|
  Stance.all.each do |stance|
    rand(15).times do
      stance.legislator_stances.create!(legislator_id: (1 + rand(Legislator.count)))
    end
    rand(2) == 0 ? stance.upvotes.create!(user_id: user.id) : nil
  end
end

# seed donations
Stance.all.each do |stance|
  stance.donations.create!(legislator_id: (1 + rand(Legislator.count)), user_id: (1 + rand(User.count)), amount: rand(25..400))
end
>>>>>>> Stashed changes
