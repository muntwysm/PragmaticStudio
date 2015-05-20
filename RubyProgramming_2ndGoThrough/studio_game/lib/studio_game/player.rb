require_relative 'playable'

module StudioGame
  class Player
    include Playable
    attr_reader :found_treasures
    attr_accessor :name,:health

    def initialize(name, health=100)
      @name = name.capitalize
      @health = health
      @found_treasures = Hash.new(0)
    end

    def self.from_csv(string)
      name, health = string.split(',')
      Player.new(name, Integer(health))
    end

    def <=>(other_player)
      other_player.score <=> score
    end

    def score
      health + points
    end

    def each_found_treasure
      @found_treasures.each do |name,points|
        yield(Treasure.new(name,points))
      end
    end

    def found_treasure(treasure)
      @found_treasures[treasure.name] += treasure.points
      puts "#{name} found a #{treasure.name} worth #{treasure.points}!"
      puts "#{name}'s treasures: #{@found_treasures}"
    end

    def points
      @found_treasures.values.reduce(0,:+)
    end

    def to_s()
      "I'm #{name} with health = #{health}, points = #{points} and score = #{score}."
    end
  end
end
