class LegislatorPosition < ActiveRecord::Base
  belongs_to :legislator
  belongs_to :position

  validates_presence_of :legislator_id, :position_id
  validates :position_value, inclusion: {in: [0,1]}
end