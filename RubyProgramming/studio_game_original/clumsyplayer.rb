require_relative 'player'

class ClumsyPlayer < Player


  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points / 2.0

    puts "#{name} found #{treasure.name} worth #{treasure.points} points but he is a clumsy fellow dropped it to half the value!"
    puts "#{name}'s treasures: #{@found_treasures}"
  end




end
