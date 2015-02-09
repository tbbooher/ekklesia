class Position < ActiveRecord::Base
  has_many :stances
  belongs_to :issue

  validates_presence_of :issue_id, :description
end