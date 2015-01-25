require 'faker'
require 'open-uri'
require 'json'

API = "https://congress.api.sunlightfoundation.com"
API_KEY = ENV["CONGRESS_API"]

LEGISLATORS_OUT_OF_OFFICE = [11808,"false"]
LEGISLATORS_IN_OFFICE = [540,"true"]
LEGISLATOR_FIELDS = "bioguide_id,aliases,district,twitter_id,campaign_twitter_ids,youtube_id,facebook_id,terms"


def get_basic_legislators_info_in(url, key)
  in_office_counter = 1
  all_legislators = []
  (LEGISLATORS_IN_OFFICE[0]/50+1).times do
    "loading basic in"
    call = JSON.parse(open(url + "/legislators?apikey=#{key}&page=#{in_office_counter}&per_page=50&in_office=#{LEGISLATORS_IN_OFFICE[1]}").read)["results"]
    call.each do |legi|
      legi["first_name"]
      all_legislators << legi
    end
    sleep 1
    in_office_counter += 1
  end
  return all_legislators
end

def get_basic_legislators_info_out(url, key)
  out_office_counter = 1
  (LEGISLATORS_OUT_OF_OFFICE[0]/50+1).times do
    "loading basic out"
    call = JSON.parse(open(url + "/legislators?apikey=#{key}&page=#{out_office_counter}&per_page=50&in_office=#{LEGISLATORS_OUT_OF_OFFICE[1]}").read)["results"]
    call.each do |legi|
      legi["first_name"]
      all_legislators << legi
    end
    sleep 1
    out_office_counter += 1
  end
  return all_legislators
end

def get_more_legislators_info_in(url, key, fields)
  in_office_counter = 1
  all_legislators = []
  (LEGISLATORS_IN_OFFICE[0]/50+1).times do
    "loading detail in"
    call = JSON.parse(open(url + "/legislators?apikey=#{key}&page=#{in_office_counter}&per_page=50&in_office=#{LEGISLATORS_IN_OFFICE[1]}&fields=#{fields}").read)["results"]
    call.each do |legi|
      all_legislators << legi
    end
    sleep 1
    in_office_counter += 1
  end
  return all_legislators
end

def get_more_legislators_info_out(url, key, fields)
  out_office_counter = 1
  (LEGISLATORS_OUT_OF_OFFICE[0]/50+1).times do
    "loading detail out"
    call = JSON.parse(open(url + "/legislators?apikey=#{key}&page=#{out_office_counter}&per_page=50&in_office=#{LEGISLATORS_OUT_OF_OFFICE[1]}&fields=#{fields}").read)["results"]
    call.each do |legi|
      all_legislators << legi
    end
    sleep 1
    out_office_counter += 1
  end
  return all_legislators
end

def insert_basic_legislators
  get_basic_legislators_info_in(API, API_KEY).each do |l|
    legislator = Legislator.create!(
      bioguide_id: l["bioguide_id"],
      first_name: l["first_name"],
      last_name: l["last_name"],
      middle_name: l["middle_name"],
      nickname: l["nickname"],
      name_suffix: l["name_suffix"],
      party: l["party"],
      phone: l["phone"],
      website: l["website"],
      office: l["office"],
      contact_form: l["contact_form"],
      fax: l["fax"]
    )
    legislator
  end
end

def insert_details
  get_more_legislators_info_in(API, API_KEY, LEGISLATOR_FIELDS).each do |l|
    politcian = Legislator.find_by bioguide_id: l["bioguide_id"]
    politcian.update(
      twitter_id: l["twitter_id"],
      campaign_twitter_ids: l["campaign_twitter_ids"],
      youtube_id: l["youtube_id"],
      facebook_id: l["facebook_id"],
      district: l["district"]
    )
    a = l["aliases"]
    if a
      Alias.create!(
        legislator_id: politcian.id,
        alias1: a[0],
        alias2: a[1],
        alias3: a[2],
        alias4: a[3],
        alias5: a[4],
        alias6: a[5]
      )
    end
    l["terms"].each do |term|
      Term.create!(
        legislator_id: politcian.id,
        start_date: term["start"],
        end_date: term["end"],
        state: term["state"],
        party: term["party"],
        senate_class: term["class"],
        title: term["title"],
        chamber: term["chamber"]
      )
    end
  end
end

def insert_image_url
  Legislator.all.each do |legislator|
    legislator.update(
      img_url: "http://theunitedstates.io/images/congress/original/#{legislator.bioguide_id}.jpg"
      )
  end
end
insert_basic_legislators
insert_details
insert_image_url


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