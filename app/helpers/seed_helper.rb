module SeedHelper

	require 'faker'
	require 'open-uri'
	require 'json'

	API = "https://congress.api.sunlightfoundation.com"
	API_KEY = ENV["CONGRESS_API"]

	module LegislatorSeed

		LEGISLATORS_OUT_OF_OFFICE = [11808,"false"]
		LEGISLATORS_IN_OFFICE = [540,"true"]
		LEGISLATOR_FIELDS = "bioguide_id,aliases,district,twitter_id,campaign_twitter_ids,youtube_id,facebook_id,terms"


		def self.get_basic_legislators_info_in(url, key)
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

		def self.get_basic_legislators_info_out(url, key)
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

		def self.get_more_legislators_info_in(url, key, fields)
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

		def self.get_more_legislators_info_out(url, key, fields)
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

		def self.insert_basic_legislators
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
		    p legislator
		  end
		end

		def self.insert_details
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

		def self.insert_image_url
		  Legislator.all.each do |legislator|
		    legislator.update(
		      img_url: "https://raw.githubusercontent.com/unitedstates/images/gh-pages/congress/450x550/#{legislator.bioguide_id}.jpg"
		      )
		  end
		end

	end

	module BioScraper

		def self.get_all_biographies
			Legislator.all.each do |legislator|
				p legislator.name
				legislator.update(biography: clean_text(legislator.bioguide_id))
			end
		end

		def self.clean_text bioguide_id
			scrape_biography(bioguide_id).gsub("\r\n\r\n", "").split(";").map { |sentence| "<p>" + sentence + "</p>"  }.join
		end

		def self.scrape_biography bioguide_id
			get_html(bioguide_id).css('table')[1].css('td')[1].css('p').text
		end

		def self.get_html bioguide_id
			Nokogiri::HTML(open(set_up_url(bioguide_id)))
		end

		def self.set_up_url bioguide_id
			"http://bioguide.congress.gov/scripts/biodisplay.pl?index=" + bioguide_id
		end

	end

	module Bills

	end

	module Votes

	end

	module Commities

	end

end