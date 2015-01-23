class Politician < ActiveRecord::Base
  has_many :politician_stances
  has_many :stances, through: :politician_stances
  has_many :bill_votes
  has_many :bills, through: :bill_votes

  validates_uniqueness_of :bioguide_id
  validates_presence_of :bioguide_id, :first_name, :last_name, :party, :phone, :website, :office, :contact_form, :fax
end