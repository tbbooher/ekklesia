class BillVote < ActiveRecord::Base
  belongs_to :bill
  belongs_to :politician

  validates_presence_of :bill_id
  validates_presence_of :politician_id
end