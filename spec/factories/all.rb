FactoryGirl.define do
  factory :bill do
    title { Faker::Lorem.sentence }
    summary { Faker::Lorem.sentence }
    official_title { Faker::Lorem.sentence }
    short_title { Faker::Lorem.sentence }
    popular_title { Faker::Lorem.sentence }
    congress_url { Faker::Internet.url }
  end

  factory :bill_vote do
    bill_id 1
    politician_id 1
  end

  factory :issue do
    description { Faker::Lorem.sentence }
  end

  factory :politician do
    bioguide_id { Faker::Lorem.word }
    first_name { Faker::Lorem.word }
    last_name { Faker::Lorem.word }
    party { Faker::Lorem.word }
    phone { Faker::Lorem.word }
    website { Faker::Lorem.word }
    office { Faker::Lorem.word }
    contact_form { Faker::Lorem.word }
    fax { Faker::Lorem.word }
  end

  factory :politician_stance do
    politician_id 1
    stance_id 1
  end

  factory :position do
    issue_id 1
    description { Faker::Lorem.sentence }
  end

  factory :stance do
    user_id 1
    position_id 1
  end

  factory :upvote do
    user_id 1
    stance_id 1
  end

  factory :user do
    first_name { Faker::Lorem.word }
    last_name { Faker::Lorem.word }
    email { Faker::Internet.email }
    password { "12345678" }
  end
end