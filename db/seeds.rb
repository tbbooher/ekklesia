('a'..'z').each do |l|
  User.create!([
    {first_name: Faker::Name.name, last_name: Faker::Name.name, email: "#{l}@#{l}.com", username: Faker::Internet.user_name, password: l, about: Faker::Company.catch_phrase, city: Faker::Address.city, state: Faker::Address.state}
  ])
end

fs_scores = [
  [[-0.0875, 0.3226563851], [0.10625, 0.1971900823]],
  [[-0.2375, 0.2774243784], [0.1625,  0.3861439406]],
  [[-0.4125, 0.4642582409], [0.01875, 0.4825064766]],
  [[0.4, 0.3464101615], [0.2, 0.561248608]],
  [[0.1625 , 0.5040904114], [0.16875, 0.4447611719]],
  [[-0.1125, 0.5249149591], [0.10625, 0.312178406]],
  [[0.2375 , 0.3852179346], [0.025, 0.4629100499]],
  [[-0.2125, 0.2474873734], [-0.00625,  0.3509553289]],
  [[-0.3875, 0.5249149591], [-0.15625,  0.6298738536]],
  [[-0.25625 , 0.5010257336], [0.025, 0.4978525312]],
  [[0.2375 , 0.3700868624], [0.025, 0.4832922807]],
  [[0.06875, 0.5509326508], [0.225, 0.514781507]],
  [[-0.06875 , 0.4199808669], [-0.11875,  0.3379956678]],
  [[0, 0.7151423435], [0.30625, 0.563431768]],
  [[-0.04375 , 0.5010257336], [-0.025,  0.2549509757]],
  [[-0.3375, 0.6653409437], [-0.175,  0.6943650748]],
  [[0.26875, 0.4542949797], [0.15625, 0.4578189755]],
  [[-0.30625 , 0.3783776458], [-0.19375,  0.3707497231]],
  [[-0.14375 , 0.4761733628], [-0.0125, 0.3593148242]]
]

counter = 1

fs_scores.each do |score|
  User.find(counter).update(fiscal_mean: fs_scores[counter-1][0][0])
  counter +=1
end

Bill.create!([
  {id: 1, official_title: "Repeal laws prohibiting adult possession and use of drugs", fiscal_initial: 1, social_initial: 0},
  {id: 2, official_title: "Military service should be voluntary. There should be no draft.", fiscal_initial: 1, social_initial: 0},
  {id: 3, official_title: "Let people control their own retirement; privatize Social Security", fiscal_initial: 0, social_initial: 1},
  {id: 4, official_title: "End 'corporate welfare.' No government handouts to business.", fiscal_initial: 0, social_initial: -1},
  {id: 5, official_title: "Federal governments should stay out of state\'s decisions regarding drug legalization ", fiscal_initial: 1, social_initial: 0.9, congress_url: "https://www.govtrack.us/congress/bills/114/hr1013"},
  {id: 6, official_title: "The federal government should offer grants to state and local law-enforcement to provide wearable body cameras for police", fiscal_initial: -0.4, social_initial: 0.8, congress_url: "https://www.govtrack.us/congress/bills/114/s877"},
  {id: 7, official_title: "No federal funds shall be appropriated or used to implement or enforce immigration amnesty ", fiscal_initial: 0.7, social_initial: -0.4, congress_url: "https://www.govtrack.us/congress/bills/114/hr155"},
  {id: 8, official_title: "Unemployment benefits should extend to 99 weeks of unemployment instead of being shortened ", fiscal_initial: -0.6, social_initial: 0.1, congress_url: "https://www.govtrack.us/congress/bills/111/hr4213"}
])

User.all.each do |user|
  Bill.all.each do |bill|
    Vote.create(user_id: user.id, bill_id: bill.id)
  end
end