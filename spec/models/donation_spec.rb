require 'rails_helper'

describe Donation do
  it "is valid with a stance, legislator and amount" do
    donation = Donation.new(stance_id: 5, legislator_id: 5, amount: 500)
    expect(donation).to be_valid
  end
  it "is invalid without a stance" do
    donation = Donation.new(legislator_id: 5, amount: 5)
    donation.valid?
    expect(donation.valid?).to be false
  end
  it "is invalid without a legislator" do
    donation = Donation.new(stance_id: 5, amount: 5)
    donation.valid?
    expect(donation.valid?).to be false
  end
  it "is invalid without an amount" do
    donation = Donation.new(stance_id: 5, legislator_id: 5)
    donation.valid?
    expect(donation.valid?).to be false
  end

  let(:params) { {stance_id: "5", donation: { "user_id" => "5", "amounts" => ["50", "70"], "legislator_ids" => ["5", "10"] }}}

  it "creates new records in donation table" do
    expect{ Donation.create_records(params) }.to change{ Donation.count }.by(2)
  end

end
