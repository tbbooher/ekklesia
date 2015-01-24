require 'open-uri'
require 'json'

API = "https://congress.api.sunlightfoundation.com"
API_KEY = ENV["CONGRESS_API"]
bill_fields = "official_title,popular_title,short_title,summary,summary_short,urls,keywords"

def bills(fields, page_count, page_number)
  return JSON.parse(open(API + "/bills?apikey=#{API_KEY}&per_page=#{page_count}&page=#{page_number}&fields=" + fields).read)
end



number_of_bills = bills(bill_fields, 50, 1)["count"]
i = 1

(number_of_bills / 50).times do
  sleep(1)
  bills(bill_fields, 50, i)["results"].each do |b|
    p Bill.create(
      official_title: b["official_title"],
      popular_title: b["popular_title"],
      short_title: b["popular_title"],
      summary: b["summary"],
      summary_short: b["summary_short"],
      congress_url: b["urls"]["congress"]
    )
  end
  i+=1
end
LEGISLATORS_OUT_OF_OFFICE = [11808,"false"]
LEGISLATORS_IN_OFFICE = [540,"true"]
LEGISLATOR_FIELDS = "bioguide_id,aliases,district,twitter_id,campaign_twitter_ids,youtube_id,facebook_id,terms"


def get_basic_legislators_info_in(url, key)
  in_office_counter = 1
  all_legislators = []
  (LEGISLATORS_IN_OFFICE[0]/50+1).times do
    p "loading basic in"
    call = JSON.parse(open(url + "/legislators?apikey=#{key}&page=#{in_office_counter}&per_page=50&in_office=#{LEGISLATORS_IN_OFFICE[1]}").read)["results"]
    call.each do |legi|
      p legi["first_name"]
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
    p "loading basic out"
    call = JSON.parse(open(url + "/legislators?apikey=#{key}&page=#{out_office_counter}&per_page=50&in_office=#{LEGISLATORS_OUT_OF_OFFICE[1]}").read)["results"]
    call.each do |legi|
      p legi["first_name"]
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
    p "loading detail in"
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
    p "loading detail out"
    call = JSON.parse(open(url + "/legislators?apikey=#{key}&page=#{out_office_counter}&per_page=50&in_office=#{LEGISLATORS_OUT_OF_OFFICE[1]}&fields=#{fields}").read)["results"]
    call.each do |legi|
      all_legislators << legi
    end
    sleep 1
    out_office_counter += 1
  end
  return all_legislators
end

def insert_basic_politicians
  get_basic_legislators_info_in(API, API_KEY).each do |l|
    legis = Politician.create!(
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
    p legis
  end
end

def insert_details
  get_more_legislators_info_in(API, API_KEY, LEGISLATOR_FIELDS).each do |l|
    politcian = Politician.find_by bioguide_id: l["bioguide_id"]
    politcian.update(
      twitter_id: l["twitter_id"],
      campaign_twitter_ids: l["campaign_twitter_ids"],
      youtube_id: l["youtube_id"],
      facebook_id: l["facebook_id"],
      district: l["district"]
    )
    a = l["aliases"]
    if a
      p Alias.create!(
        politician_id: politcian.id,
        alias1: a[0],
        alias2: a[1],
        alias3: a[2],
        alias4: a[3],
        alias5: a[4],
        alias6: a[5]
      )
    end
    l["terms"].each do |term|
      p Term.create!(
        politician_id: politcian.id,
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
insert_basic_politicians
insert_details