require 'rails_helper'

describe Politician do
  it 'has a valid factory' do
    expect(build(:politician)).to be_valid
  end

  it "is invalid without a bioguide_id" do
    expect(build(:politician, bioguide_id: nil)).to be_invalid
  end

  it "is invalid without a first_name" do
    expect(build(:politician, first_name: nil)).to be_invalid
  end

  it "is invalid without a last_name" do
    expect(build(:politician, last_name: nil)).to be_invalid
  end

end

