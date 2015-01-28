class Position < ActiveRecord::Base
  has_many :stances
  belongs_to :issue

  validates_presence_of :issue_id, :description

  def self.group_by_issues
    Issue.all.map{ |issue| issue.positions }
  end
end