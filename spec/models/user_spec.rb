require 'rails_helper'

describe User do
  it "should calculate the right score" do
    u = FactoryGirl.create(:user)
    p = {"social1"=>"1", "social2"=>"0", "social3"=>"-1", "social4"=>"1", "social5"=>"1", "fiscal1"=>"1", "fiscal3"=>"1", "fiscal4"=>"1", "fiscal5"=>"1"}
    expect(u.update_score(p)).to eq([4, 2])
    expect(u.fiscal_score).to eq(2)
  end
end

