require_relative 'die'
require_relative 'player'
require_relative 'treasuretrove'

module GameTurn


  def	self.take_turn(player)
    die = Die.new
    number = die.roll

    case number
    when 1..2
      player.blammed
    when 3..4
      puts "#{player.name} was skipped."
    else
      player.w00ted
    end

    random_treasure = TreasureTrove.random
    player.found_treasure(random_treasure)

  end

end
