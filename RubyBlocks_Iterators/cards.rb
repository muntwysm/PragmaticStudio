cards = ["Jack","King","Ace","Joker"]

cards.shuffle!
cards.each {|card| puts "#{card.upcase} - #{card.length}"}

puts 'Reversed!'
cards.reverse_each {|card| puts "#{card.upcase} - #{card.length}"}

scores ={ "Larry" => 10, "Moe" => 8, "Curly" => 12}

scores.each {|key,value| puts "#{key} scored a #{value}!" }
