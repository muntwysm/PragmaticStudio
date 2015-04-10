class Player
  attr_reader :health, :score
  attr_accessor :name


  def initialize name , health =100
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def to_s
    "I'm #{@name.capitalize} with health = #{@health}, points = #{points}, and score = #{score}."
  end


  def points
    @found_treasures.values.reduce(0,:+)
  end

  def strong?
    health >= 100
  end

  def <=>(other_player)
    other_player.score <=> score
  end

  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points

    puts "#{name} found #{treasure.name} worth #{treasure.points} points!"
    puts "#{name}'s treasures: #{@found_treasures}"
  end

  def blammed
    @health -= 10
    @score = @health + points
    puts "#{@name} got blammed"
  end

  def w00ted
    @health += 15
    @score = @health + points
    puts "#{@name} got w00ted"
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
