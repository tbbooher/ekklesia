require 'rails_helper'

describe 'Affinity' do
  it 'should be able to calculate the eclidian distance between two points' do
    expect('%.4f' % Affinity.distance(1, 1, 2, 2)).to eql("1.4142")
  end

  it 'should be able to calculate the overlap coefficient' do
    # [overlap] = calc_overlap_twonormal(2,2,0,1,-10,10,0.01) should equal  0.8026
    # per http://www.tandfonline.com/doi/pdf/10.1080/03610928908830127
  end

  it 'should be able to compute the normal pdf' do
    expect(Affinity.normal_pdf(0.5,2,1)).to be_within(0.001).of(0.13)
    expect(Affinity.normal_pdf(0,1,1)).to be_within(0.001).of(0.2419)
  end

  it 'should compute an integral' do
    f = lambda {|x| Math.sin(x) }
    expect(Affinity.simpson_rule_try_2(f,0,3.1415)).to be_within(0.1).of(2)
  end

  it 'should correctly compute the Bhattacharyya coefficient' do

  end
end