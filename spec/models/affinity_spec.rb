require 'rails_helper'

describe 'Affinity' do
  it "should be able to calculate the eclidian distance between two points" do
    expect('%.4f' % Affinity.distance(1, 1, 2, 2)).to eql("1.4142")
  end

  it "should be able to calculate the overlap coefficient" do
    # [overlap] = calc_overlap_twonormal(2,2,0,1,-10,10,0.01) should equal  0.8026
    # per http://www.tandfonline.com/doi/pdf/10.1080/03610928908830127

  end
end