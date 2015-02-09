class Bill < ActiveRecord::Base
  belongs_to :issue
  has_many :bill_votes
  has_many :legislators, through: :bill_votes
  has_many :breakdowns

  validates_presence_of :official_title
end