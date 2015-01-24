class Politician < ActiveRecord::Base
  has_many :politician_stances
  has_many :stances, through: :politician_stances
  has_many :bill_votes
  has_many :bills, through: :bill_votes
  has_many :terms
  has_one :alias

  validates_uniqueness_of :bioguide_id
  validates_presence_of :bioguide_id, :first_name, :last_name

  def name
    "#{first_name} #{last_name}"
  end
end