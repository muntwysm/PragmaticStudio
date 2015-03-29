class Event < ActiveRecord::Base

	def free?
		price.zero? || price.blank?
	end

	def self.upcoming
		where("starts_at >= ?", Time.now).order("starts_at")
	end

end
