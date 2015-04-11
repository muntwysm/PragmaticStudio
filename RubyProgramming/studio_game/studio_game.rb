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
knuckleheads.load_players(ARGV.shift || 'players.csv')

klutz = ClumsyPlayer.new('klutz',105)
knuckleheads.add_player(klutz)
beserker = BerserkPlayer.new('beserker',50)
knuckleheads.add_player(beserker)
klutz2 = ClumsyPlayer.new('klutz2',105)
knuckleheads.add_player(klutz2)



loop do

  puts "How many game rounds?('quit' to exit)"

  answer = gets.chomp.downcase

  case answer
  when /^[0-9]*$/
    knuckleheads.play(Integer(answer))
    #break
  when 'quit','exit'
    break
  else
    puts 'please enter a number or quit'
  end
end


#knuckleheads.play(10) do knuckleheads.total_points >= 2000 end
