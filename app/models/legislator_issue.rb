class LegislatorIssue < ActiveRecord::Base
  belongs_to :legislator
  belongs_to :issue

  validates_presence_of :legislator_id, :issue_id

  scope :for_issue, ->(issue_id) { where(issue_id: issue_id) }

end

