require 'rails_helper'

describe Legislator do
  it 'has a valid factory' do
    expect(build(:legislator)).to be_valid
  end

  it "is invalid without a bioguide_id" do
    expect(build(:legislator, bioguide_id: nil)).to be_invalid
  end

  it "is invalid without a first_name" do
    expect(build(:legislator, first_name: nil)).to be_invalid
  end

  it "is invalid without a last_name" do
    expect(build(:legislator, last_name: nil)).to be_invalid
  end

end

