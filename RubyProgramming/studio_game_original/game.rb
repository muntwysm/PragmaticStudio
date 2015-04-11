require_relative 'player'
require_relative 'clumsyplayer'
require_relative 'berserk_player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasuretrove'

class Game
  attr_reader :name, :players

  def initialize(name)
    @name = name
    @players = []
  end

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

  def load_players file_name
    File.readlines(file_name).each do |line|
      add_player(Player.from_csv(line))
    end
  end

  def save_high_scores(to_file)
    File.open(to_file,'w') do |file|
      file.puts("#{name} High Scores:\n")

      @players.sort.each do |player|
        file.puts high_score_entry(player)
      end
    end
  end

  def high_score_entry(player)
    formatted_name = player.name.ljust(20, '.')
    "#{formatted_name} #{player.score}"
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

      if block_given?
        if yield
          puts "The game has ended as maximum number of points has reached #{total_points}\n"
          break
        end
      end
      puts "Round #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end

    print_stats

    high_score

    save_high_scores('high_scores')

  end

  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end

  def high_score

    sorted_players = @players.sort
    puts "\n#{name} High Score"

    sorted_players.each do |player|
      puts high_score_entry(player)
    end

  end


  def print_stats

    @players.each do |player|
      print player
      player.each_treasure do |treasure|
        puts "#{treasure.name} total points #{treasure.points}"
      end
      puts "\n #{player.name} Point Totals: \n #{player.points} grand total points."
    end

    puts "\n Total number of treasure points for entire game is : #{total_points}"
  end
end

if __FILE__ == $0

end
