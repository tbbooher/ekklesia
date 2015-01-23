class PoliticianStance < ActiveRecord::Base
  belongs_to :politician
  belongs_to :stance

  validates_presence_of :politician_id, :stance_id
end