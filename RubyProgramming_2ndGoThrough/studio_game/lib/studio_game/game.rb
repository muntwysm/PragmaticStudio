require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'
require 'csv'

module StudioGame
  class Game

    attr_reader :title,:players
    def initialize (title)
      @title = title
      @players = []
    end

    def add_player(player)
      @players << player
    end

    def load_players_csv(file_name)
      CSV.foreach(file_name) do |row|

        name,health = row[0],row[1]
        add_player(Player.new(name, health.to_i))
      end
    end

    def load_players(file_name)
      File.readlines(file_name).each do |line|
        add_player(Player.from_csv(line))
      end
    end


    def high_score_entry(player)
      formatted_name = player.name.ljust(20, '.')
      "#{formatted_name} #{player.score}"
    end

    def save_high_scores
      File.open('high_scores.txt','w') do |file|
        file.puts "#{title} High scores:"
        @players.sort.each do |player|
          file.puts high_score_entry(player)
        end
      end
    end

    def play(rounds)
      puts "There are #{players.size} players in the game #{title}:\n"

      players.each do |player|
        puts player
      end

      treasures = TreasureTrove::TREASURES

      puts "There are #{treasures.size} treasures in the game! :\n"
      treasures.each do|treasure|
        puts "A #{treasure.name} is worth #{treasure.points} points"
      end

      1.upto(rounds) do |round|

        if block_given?
          break if yield(self)
          puts 'maximum score reached'
        end

        puts "\nRound #{round} : \n"

        players.each do |player|
          GameTurn.take_turn(player)
          puts player
        end
      end

      print_stats
    end

    #def total_points
    #  total = 0
    #  @players.each do |player|
    #    total += player.found_treasures.values.reduce(0,:+)
    #  end
    #  total
    #end

    def total_points
      @players.reduce(0) { |sum, player| sum + player.points }
    end


    def print_stats
      puts "\n#{title} Statistics:\n"

      strong_players,wimpy_players = @players.partition {|player| player.strong?}

      puts "#{strong_players.size} strong players:"

      strong_players.each do |player|
        print_name_and_health(player)
      end

      puts "#{wimpy_players.size} wimpy players:"

      wimpy_players.each do |player|
        print_name_and_health(player)
      end

      puts "\n#{title} High Scores:\n"
      @players.sort.each do |player|
        puts high_score_entry(player)
      end

      @players.each do |player|
        puts "\n#{player.name} point totals:\n"

        player.each_found_treasure do |treasure|
          puts "#{treasure.points} total #{treasure.name} points"
        end
        puts "#{player.points} grand total points\n"
      end

      puts "\n#{total_points} total points from treasures found"

    end

    def print_name_and_health(player)
      puts "#{player.name} (#{player.health})"
    end
  end
end
