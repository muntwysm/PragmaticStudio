require_relative 'die'
require_relative 'player'

module GameTurn

  def self.take_turn(player)
    die = Die.new

    rolled_number = die.roll

    case rolled_number

    when 1..2
      player.blam
    when 3..4
      puts 'player was skipped'
    else
      player.w00t
    end
  end
end
