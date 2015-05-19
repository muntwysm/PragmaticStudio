require_relative 'game'
require_relative 'clumsy_player'


player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.load_players_csv(ARGV.shift || "players.csv")
klutz = ClumsyPlayer.new("klutz", 105)
knuckleheads.add_player(klutz)


#knuckleheads.add_player(player1)
#knuckleheads.add_player(player2)
#knuckleheads.add_player(player3)
##knuckleheads.play(10) {knuckleheads.total_points >= 2000 }


loop do
  puts "How many game rounds ('quit' to exit)?"
  answer = gets.chomp.downcase
  puts answer

  case answer
  when /^\d+$/
    knuckleheads.play(answer.to_i)

  when 'quit' , 'exit'
    knuckleheads.print_stats
    knuckleheads.save_high_scores
    break
  else
    puts 'Please enter a number!'
  end
end
