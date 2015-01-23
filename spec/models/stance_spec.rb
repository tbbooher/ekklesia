require 'rails_helper'

describe Stance do
  it 'has a valid factory' do
    expect(build(:stance)).to be_valid
  end

  it "is invalid without a user" do
    expect(build(:stance, user_id: nil)).to be_invalid
  end

  it "is invalid without a position" do
    expect(build(:stance, position_id: nil)).to be_invalid
  end

end