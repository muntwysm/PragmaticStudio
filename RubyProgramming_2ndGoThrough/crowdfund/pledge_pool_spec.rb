require_relative 'pledge_pool'


describe PledgePool do

  it 'has a 3 pledges' do
    PledgePool::PLEDGES.size.should == 3
  end

  it 'has a random pledge' do
    pledge = PledgePool.random
    PledgePool::PLEDGES.should include(pledge)
  end


end
