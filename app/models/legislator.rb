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
    self.terms.last.chamber.capitalize
  end

  def offical_prefix
    if self.terms.last.chamber == "house"
      return "Rep."
    elsif self.terms.last.chamber == "senate"
      return "Sen."
    end
  end

  def get_issue_score(issue)
    if self.legislator_issues.for_issue(issue) != []
      return self.legislator_issues.for_issue(issue).first.issue_score
    end
  end

  def get_spectrum_value(score)
  case score
      when 0..14 then return "Liberal"
      when 15..29 then return "Democrat"
      when 30..44 then return "Progressive"
      when 45..55 then return "Independent"
      when 56..70 then return "Moderate"
      when 71..85 then return "Republican"
      when 86..100 then return "Conservative"
    end
  end

  def self.filter_legislators_by_vote_count(issue_id)
    array = []
    BillVote.where(issue_id: issue_id).group(:legislator_id).count.sort_by {|k,v| v}.reverse.slice(0,300).to_h.each do |k,v|
      array << Legislator.find(k)
    end
    array.sample(80)
  end
end

