require 'open-uri'
require 'json'

API = "https://congress.api.sunlightfoundation.com"
API_KEY = ENV["CONGRESS_API"]
bill_fields = "official_title,popular_title,short_title,summary,summary_short,urls,keywords"

def bills(fields, page_count, page_number)
  return JSON.parse(open(API + "/bills?apikey=#{API_KEY}&per_page=#{page_count}&page=#{page_number}&fields=" + fields).read)
end



number_of_bills = bills(fields, 50, 1)["count"]
i = 1

(number_of_bills / 50).times do
  sleep(1)
  bills(fields, 50, i)["results"].each do |b|
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
