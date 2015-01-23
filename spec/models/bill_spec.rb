require 'rails_helper'

describe Bill do
  it 'has a valid factory' do
    expect(build(:bill)).to be_valid
  end

  it "is invalid without a title" do
    expect(build(:bill, official_title: nil)).to be_invalid
  end
end

