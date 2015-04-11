require_relative 'playable'



class Player
  include Playable
  attr_reader :score
  attr_accessor :name, :health


  def initialize name , health =100
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def to_s
    "I'm #{@name.capitalize} with health = #{@health}, points = #{points}, and score = #{score}."
  end


  def each_treasure
    @found_treasures.each do |name,points|
      treasure = Treasure.new(name,points)
      yield(treasure)
    end
  end

  def points
    @found_treasures.values.reduce(0,:+)
  end



  def <=>(other_player)
    other_player.score <=> score
  end

  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points

    puts "#{name} found #{treasure.name} worth #{treasure.points} points!"
    puts "#{name}'s treasures: #{@found_treasures}"
  end

  def self.from_csv csv_line
    name,health = csv_line.split(',')
    Player.new(name,Integer(health))
  end




  def score
    @health + points
  end

  #def score=new_score
  # @score = new_score
  #end
end

if __FILE__ == $0


end
