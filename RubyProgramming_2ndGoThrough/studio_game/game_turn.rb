require_relative 'die'
require_relative 'player'
require_relative 'treasure_trove'


module GameTurn

  def self.take_turn(player)
    die = Die.new
    #die = LoadedDie.new
    rolled_number = die.roll

    case rolled_number

    when 1..2
      player.blam
    when 3..4
      puts 'player was skipped'
    else
      player.w00t
    end

    treasure_found = TreasureTrove.random
    player.found_treasure(treasure_found)



  end
end
