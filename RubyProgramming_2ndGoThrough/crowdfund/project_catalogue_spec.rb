require_relative 'project_catalogue'

describe ProjectCatalogue do

  before do
    @project_catalogue = ProjectCatalogue.new('Chris Projects')

    @project = Project.new('Chris')

    @project_catalogue.add_project(@project)
  end


  it 'should remove funding when a low number is rolled' do

    Die.any_instance.stub(:roll).and_return(1)

    @project_catalogue.request_funding(2)

    @project.funding.should == -10


  end

  it 'should add funding when a high number is rolled' do

    Die.any_instance.stub(:roll).and_return(5)

    @project_catalogue.request_funding(2)

    @project.funding.should == 25
  end

  context 'it is fully funded' do
    before do
      @project_catalogue = ProjectCatalogue.new('Chris Projects')

      @project = Project.new('Chris',1000.00,1000.00)

      @project_catalogue.add_project(@project)
    end

    it 'is fully funded' do
      @project.fully_funded?.should == true

    end
  end





end
