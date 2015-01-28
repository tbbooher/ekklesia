class Bill < ActiveRecord::Base
  has_many :bill_votes
  has_many :breakdowns
  has_many :legislators, through: :bill_votes
  belongs_to :issue

  validates_presence_of :official_title
end