require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasuretrove'

class Game
  attr_reader :name

  def total_points
    sum = 0
    @players.each do |player|
      sum += player.points
    end
    #@players.reduce(0) { |sum, player| sum + player.points }
    sum
  end

  def self.status
    puts 'TEST'
  end

  def initialize(name)
    @name = name
    @players = []
  end

  def add_player(player)
    @players.push(player)
  end

  def play(rounds)
    puts "There are #{@players.size} players in : #{name}."

    treasures  = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.size} treasures in the game"

    treasures.each do |treasure|

      puts "\nA #{treasure.name} is worth #{treasure.points} points."

    end

    @players.each do |player|
      puts player
    end

    1.upto rounds do |round|

      puts "Round #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)
        #puts player
      end
    end

    print_stats

    high_score

  end

  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end

  def high_score

    sorted_players = @players.sort
    puts "\n#{name} High Score"

    sorted_players.each do |player|
      puts "#{player.name}..............#{player.score}\n"
    end

  end


  def print_stats

    @players.each do |player|
      puts "\n #{player.name} Point Totals: \n #{player.points} grand total points."
    end

    puts "\n Total number of treasure points is : #{total_points}"


    #strong_players, wimpy_players = @players.partition{|player| player.strong? }

    #puts "\nStrong Players are :"
    #strong_players.each do |player|
    #  print_name_and_health(player)
    #end

    #puts "\nWimpy Players are :"
    #puts wimpy_players.each do |player|
    #  print_name_and_health(player)
    #end

  end
end

if __FILE__ == $0

end
