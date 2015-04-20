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
    @health = @health + 15
    puts "#{@name} got blammed!"
  end

  def w00t
    @health -= 10
    puts "#{@name} got w00ted!"
  end
end


player1 = Player.new("moe")
puts player1

player2 = Player.new("larry", 60)
puts player2

player3 = Player.new("curly", 125)
puts player3
player3.blam
puts player3
player3.w00t
puts player3

puts "3" * 5
player2 = Player.new("larry", 60)
puts player2.name
player2.name = "Lawrence"
puts player2.name
puts player2.health
puts player2.score
puts player2

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

players = [player1,player2,player3]

puts "There are #{players.size} players in the game :\n"
players.each do |player|
  puts player
end

puts "Health Report:\n"
players.each do |player|
  puts "#{player.name}'s' Health : #{player.health}"
end

players.each do |player|
  player.blam
  player.w00t
  player.blam
  puts player
end
