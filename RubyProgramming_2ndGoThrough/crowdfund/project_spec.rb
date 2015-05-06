require_relative 'project'

describe Project do

  it 'has an initial target funding amount' do
    project = Project.new('Bathroom',1000.00,5000.00)
    project.target_funding.should == 5000.00
  end

  it 'has a total outstanding fund amount' do
    project = Project.new('Bathroom',1000.00,5000.00)
    project.total_funding_still_needed.should == 5000.00 - 1000.00
  end

  it 'increases funds by 25 when funds are added' do
    project = Project.new('Bathroom',1000.00,5000.00)
    project.add_funds.should
    project.funding.should == 1025.00
  end

  it 'decreases funds by 10 when funds are removed' do
    project = Project.new('Bathroom',1000.00,5000.00)
    project.remove_funds.should
    project.funding.should == 990.00
  end

  it 'has a default funding amount' do
    project = Project.new('Bathroom')
    project.funding.should == 0
  end
end
