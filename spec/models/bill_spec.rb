require 'rails_helper'

describe Bill do
  it 'has a valid factory' do
    expect(build(:bill)).to be_valid
  end

  it "is invalid without a title" do
    expect(build(:bill, title: nil)).to be_invalid
  end

  it "is invalid without a congress_url" do
    expect(build(:bill, congress_url: nil)).to be_invalid
  end
end

