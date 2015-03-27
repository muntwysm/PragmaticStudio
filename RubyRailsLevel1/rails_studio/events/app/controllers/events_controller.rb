class EventsController < ApplicationController

	def index
		@events = Event.upcoming
	end

	def show
		id = params[:id]
		@event = Event.find(id)
	end

	def edit
		id = params[:id]
		@event = Event.find(id)
	end

	def update
		@event = Event.find(params[:id])
	
		@event.update(event_params)
		redirect_to @event
	end

	def new

		@event = Event.new

	end

	def create
		@event = Event.new(event_params)
		@event.save
		redirect_to @event
	end

	def destroy
		@movie = Event.find(params[:id])
		@movie.delete
		redirect_to movies_path
	end

	private

	def event_params
		event_params = params.require(:event).
				permit(:name,:description,:location,:price,:starts_at,:image_file_name,:capacity)
	end



end
