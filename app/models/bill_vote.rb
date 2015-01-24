class BillVote < ActiveRecord::Base
  belongs_to :bill
  belongs_to :legislator

  validates_presence_of :bill_id
  validates_presence_of :legislator_id
end