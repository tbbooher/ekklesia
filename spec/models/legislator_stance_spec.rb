require 'rails_helper'

describe LegislatorStance do
  it 'has a valid factory' do
    expect(build(:legislator_stance)).to be_valid
  end

  it "is invalid without a legislator" do
    expect(build(:legislator_stance, legislator_id: nil)).to be_invalid
  end

  it "is invalid without a stance" do
    expect(build(:legislator_stance, stance_id: nil)).to be_invalid
  end

end