require 'rails_helper'

describe 'Affinity' do
  it "should be able to calculate the eclidian distance between two points" do
    expect('%.4f' % Affinity.distance(1, 1, 2, 2)).to eql("1.4142")
  end
end