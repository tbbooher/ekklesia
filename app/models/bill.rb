class Bill < ActiveRecord::Base
  has_many :bill_votes
  has_many :legislator, through: :bill_votes

  validates_presence_of :official_title
end