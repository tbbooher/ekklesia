require 'rails_helper'

describe Bill do
  it 'has a valid factory' do
    expect(build(:bill)).to be_valid
  end

  it "is invalid without a title" do
    expect(build(:bill, official_title: nil)).to be_invalid
  end

  it "should deliver the best 10" do
    Bill.show_10.size.should_be 10
  end

  it "should get all bills not voted on" do
    FactoryGirl.create_list(:random_bill, 10)
    person = FactoryGirl.create(:user)
    bill = FactoryGirl.create(:bill)
    vote = Vote.create(user: person, bill: bill, direction: "yes")
    expect(Bill.not_voted_on(person).include?(bill)).to be(false)
  end
end

