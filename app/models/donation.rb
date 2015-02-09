class Donation < ActiveRecord::Base
  belongs_to :user
  belongs_to :stance
  belongs_to :legislator

  validates_presence_of :stance_id
  validates_presence_of :legislator_id
  validates_presence_of :amount

  def self.create_records(params)
    user_id = params[:donation]["user_id"].to_i
    stance_id = params[:stance_id].to_i
    legislator_ids = params[:donation]["legislator_ids"].map { |l| l.to_i }
    amounts = params[:donation]["amounts"].map { |a| a.to_i * 100 }
    legislator_amounts = Hash[legislator_ids.zip(amounts)]

    legislator_amounts.each do |legislator_id, amount|
      Donation.create(
        user_id: user_id,
        stance_id: stance_id,
        legislator_id: legislator_id,
        amount: amount
        )
    end
  end
end
