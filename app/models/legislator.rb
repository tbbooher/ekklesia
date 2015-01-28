class Legislator < ActiveRecord::Base
  has_many :legislator_stances
  has_many :stances, through: :legislator_stances
  has_many :bill_votes
  has_many :bills, through: :bill_votes
  has_many :terms
  has_one :alias
  has_many :donations
  has_many :legislator_issues
  has_many :issues, through: :legislator_issues

  validates_uniqueness_of :bioguide_id
  validates_presence_of :bioguide_id, :first_name, :last_name

  def name
    "#{first_name} #{last_name}"
  end

  def current_state
    self.terms.first.state
  end

  def current_chamber
    self.terms.first.chamber.capitalize
  end

  def offical_prefix
    if self.terms.first.chamber == "house"
      return "Rep."
    elsif self.terms.first.chamber == "senate"
      return "Sen."
    end
  end

end