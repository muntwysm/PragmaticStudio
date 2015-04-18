def current_time
  time = Time.now
  time.strftime("%I:%M:%S")
end


def say_hello(player_name,player_health = 100)
  puts "I'm #{player_name.capitalize} with a health of #{player_health} as of #{current_time}."
end

puts say_hello("larry", 60)
puts say_hello("curly", 125)
puts say_hello("moe")
puts say_hello("shemp", 90)
