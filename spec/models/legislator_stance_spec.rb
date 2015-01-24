require 'rails_helper'

describe PoliticianStance do
  it 'has a valid factory' do
    expect(build(:politician_stance)).to be_valid
  end

  it "is invalid without a politician" do
    expect(build(:politician_stance, politician_id: nil)).to be_invalid
  end

  it "is invalid without a stance" do
    expect(build(:politician_stance, stance_id: nil)).to be_invalid
  end

end