class EventsController < ApplicationController

	def index
		@events = ['BugSmash','Hackathon','Kata Camp','Rails User Groups']
	end
end
