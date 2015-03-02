class Player
	def initialize playerName , playerhealth =100
		@playerName = playerName
		@playerhealth = playerhealth
	end

	def to_s
		"I'm #{@playerName.capitalize} with a health of #{@playerhealth}."
	end

	def blammed
		@playerhealth -= 10
		puts "#{@playerName} got blammed"
	end

	def w00ted
		@playerhealth += 10
		puts "#{@playerName} got w00ted"
	end
end

def time 
	time = Time.now
	time
end

puts "The game started on #{time} ."

playerLarry = Player.new('Larry',100)

puts playerLarry

playerLarry.blammed

puts playerLarry

playerLarry.w00ted

puts playerLarry

