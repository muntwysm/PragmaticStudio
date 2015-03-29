class Movie < ActiveRecord::Base

	def flop? 
		if total_gross < 50000000
			true
		end
	end

	def self.released
		where("released_on <= ?",Time.now).order("released_on")
	end

end
