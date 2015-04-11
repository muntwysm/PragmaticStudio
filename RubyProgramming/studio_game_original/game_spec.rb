require_relative 'game'


describe Game do

  before do
    @game = Game.new('Knuckleheads')
    @inital_health = 100
    @player = Player.new('Moe',@inital_health)
    @game.add_player(@player)
    @rounds = 2
  end




  it "assigns a treasure for points during a player's turn" do
    game = Game.new("Knuckleheads")
    player = Player.new("moe")

    game.add_player(player)

    game.play(1)

    player.points.should_not be_zero

    # or use alternate expectation syntax:
    # expect(player.points).not_to be_zero
  end


  it "computes total points as the sum of all player points" do
    game = Game.new("Knuckleheads")

    player1 = Player.new("moe")
    player2 = Player.new("larry")

    game.add_player(player1)
    game.add_player(player2)

    player1.found_treasure(Treasure.new(:hammer, 50))
    player1.found_treasure(Treasure.new(:hammer, 50))
    player2.found_treasure(Treasure.new(:crowbar, 400))

    game.total_points.should == 500
  end

  it 'should blam a player if we get a low roll' do
    Die.any_instance.stub(:roll).and_return(1)
    @game.play(@rounds)
    @player.health.should == @inital_health - (10 * 2)
  end

  it 'should SKIP a player if we get a MEDIUM roll' do
    Die.any_instance.stub(:roll).and_return(4)
    @game.play(@rounds)
    @player.health.should == @inital_health
  end

  it 'should W00T a player if we get a high roll' do
    Die.any_instance.stub(:roll).and_return(5)
    @game.play(@rounds)
    @player.health.should == @inital_health + (15 * 2)
  end

  context "in a collection of players" do
    before do
      @player1 = Player.new("moe", 100)
      @player2 = Player.new("larry", 200)
      @player3 = Player.new("curly", 300)

      @players = [@player1, @player2, @player3]
    end

    it "is sorted by decreasing score" do
      @players.sort.should == [@player3, @player2, @player1]
    end
  end







end
