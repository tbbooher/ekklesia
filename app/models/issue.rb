class Issue < ActiveRecord::Base
  has_many :positions
  has_many :legislator_issues
  has_many :legislators, through: :legislator_issues
  has_many :bills

  validates_presence_of :description

  def self.fetch(num)
    Issue.all.shuffle.slice(0..num)
  end
end
