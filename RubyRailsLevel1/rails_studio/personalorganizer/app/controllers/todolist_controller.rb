class TodolistController < ApplicationController

	def index
		@todolist = ['Wash','Cook','Clean']
	end

end
