class Player

  attr_reader :health
  attr_accessor :name

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end

  def score
    name.length + health
  end

  def to_s()
    "I'm #{name} with a health of #{health} and a score of #{score}."
  end

  def blam
    @health = @health - 10
    puts "#{@name} got blammed!"
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end

  def strong?
    health > 100
  end

end
