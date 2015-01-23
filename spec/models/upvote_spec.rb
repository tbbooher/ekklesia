require 'rails_helper'

describe Upvote do
  it 'has a valid factory' do
    expect(build(:upvote)).to be_valid
  end

  it "is invalid without a user" do
    expect(build(:upvote, user_id: nil)).to be_invalid
  end

  it "is invalid without a stance" do
    expect(build(:upvote, stance_id: nil)).to be_invalid
  end

end