require 'rails_helper'

describe Issue do
  it 'has a valid factory' do
    expect(build(:issue)).to be_valid
  end

  it "is invalid without a description" do
    expect(build(:issue, description: nil)).to be_invalid
  end
end

