require 'rails_helper'

describe Upvote do
  context 'test invalidity' do
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

  context 'upvote creation' do
    before :each do
      @user = FactoryGirl.create(:user)
      @stance = @user.stances.create(attributes_for(:stance))
      @upvote = @stance.upvotes.create(attributes_for(:upvote))
    end

    it 'creates an upvote record with the correct user_id' do
      expect(@upvote.user_id).to eq(@user.id)
    end

    it 'creates an upvote record with the correct stance_id' do
      expect(@upvote.stance_id).to eq(@stance.id)
    end
  end

  context 'saves to db' do
    it 'adds an upvote to the upvotes table in the db' do
      expect{ create(:upvote) }.to change{ Upvote.count }.by(1)
    end
  end
end
