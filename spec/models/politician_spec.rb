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

  it "is invalid without a party" do
    expect(build(:politician, party: nil)).to be_invalid
  end

  it "is invalid without a phone" do
    expect(build(:politician, phone: nil)).to be_invalid
  end

  it "is invalid without a website" do
    expect(build(:politician, website: nil)).to be_invalid
  end

  it "is invalid without a office" do
    expect(build(:politician, office: nil)).to be_invalid
  end

  it "is invalid without a contact_form" do
    expect(build(:politician, contact_form: nil)).to be_invalid
  end

  it "is invalid without a fax" do
    expect(build(:politician, fax: nil)).to be_invalid
  end
end

