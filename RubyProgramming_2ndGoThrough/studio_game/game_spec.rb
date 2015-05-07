require_relative 'game'

describe Game do

  before do
    @game = Game.new("Knuckleheads")

    @initial_health = 100
    @player = Player.new("moe", @initial_health)

    @game.add_player(@player)
  end

  it 'should increase a players health by 15 if a high number is rolled'  do

    high_number = Die.any_instance.stub(:roll).and_return(5)

    @game.play

    @player.health.should == @initial_health + 15
  end

  it 'should skip a player when a medium number is rolled' do

    Die.any_instance.stub(:roll).and_return(3)

    @game.play

    @player.health.should == @initial_health

  end

  it 'should blam a player when a low number is rolled' do

    Die.any_instance.stub(:roll).and_return(2)

    @game.play

    @player.health.should == @initial_health - 10
  end



end
