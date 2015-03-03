class Player
	attr_reader :health
	attr_accessor :name


	def initialize name , health =100
		@name = name
		@health = health
	end

	def to_s
		"I'm #{@name.capitalize} with a health of #{@health} and score of #{score}."
	end

	def blammed
		@health -= 10
		@score = @health + @name.length
		puts "#{@name} got blammed"
	end

	def w00ted
		@health += 10
		@score = @health + @name.length
		puts "#{@Name} got w00ted"
	end

	def score
		@name.length + @health
	end

	#def score=new_score
	#	@score = new_score
	#end


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

puts playerLarry.score

