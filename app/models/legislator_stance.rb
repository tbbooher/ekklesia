class LegislatorStance < ActiveRecord::Base
  belongs_to :legislator
  belongs_to :stance

  validates_presence_of :legislator_id, :stance_id
end