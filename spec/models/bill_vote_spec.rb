require 'rails_helper'

describe BillVote do
  it 'has a valid factory' do
    expect(build(:bill_vote)).to be_valid
  end

  it "is invalid without a bill_id" do
    expect(build(:bill_vote, bill_id: nil)).to be_invalid
  end

  it "is invalid without a politician_id" do
    expect(build(:bill_vote, politician_id: nil)).to be_invalid
  end
end

