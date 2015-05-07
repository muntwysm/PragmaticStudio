require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
class Game

  attr_reader :title,:players
  def initialize (title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play
    puts "There are #{players.size} players in the game #{title}:\n"

    players.each do |player|
      puts player
    end

    players.each do |player|
      GameTurn.take_turn(player)
      puts player
    end
  end
end
