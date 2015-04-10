require_relative 'player'
require_relative 'treasuretrove'
describe Player do

  before do
    @inital_health = 150
    @player = Player.new('vincent',@inital_health)
    $stdout = StringIO.new
  end

  it 'has a capitalized name' do
    @player.name.should == 'Vincent'
  end

  it "has a string representation" do
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:hammer, 50))


    @player.to_s.should == "I'm Vincent with health = 150, points = 100, and score = 250."
  end

  it "computes a score as the sum of its health and points" do
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:hammer, 50))

    @player.score.should == 250
  end

  it 'increases health by 15 when w00ted' do
    @player.w00ted
    @player.health.should == 165
  end

  it 'decreases health by 10 when blammed' do
    @player.blammed
    @player.health.should == 140
  end

  it "computes points as the sum of all treasure points" do
    @player.points.should == 0

    @player.found_treasure(Treasure.new(:hammer, 50))

    @player.points.should == 50

    @player.found_treasure(Treasure.new(:crowbar, 400))

    @player.points.should == 450

    @player.found_treasure(Treasure.new(:hammer, 50))

    @player.points.should == 500
  end

  context 'a player who is strong' do

    before do
      @player = Player.new('Larry',100)
    end

    it 'a player who has health above 100 is strong' do
      @player.strong?.should == true
    end
  end
end
