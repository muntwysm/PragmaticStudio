require_relative 'game'

def time
  time = Time.now
  time
end

puts "The game started on #{time} ."

playerLarry = Player.new('Larry',100)
playerAndrew = Player.new('Curly',100)
playerMoe = Player.new('Moe',100)



knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(playerLarry)
knuckleheads.add_player(playerAndrew)
knuckleheads.add_player(playerMoe)
knuckleheads.play(3)
