require 'rails_helper'

describe Position do
  it 'has a valid factory' do
    expect(build(:position)).to be_valid
  end

  it "is invalid without an issue" do
    expect(build(:position, issue_id: nil)).to be_invalid
  end

  it "is invalid without a description" do
    expect(build(:position, description: "")).to be_invalid
  end

end