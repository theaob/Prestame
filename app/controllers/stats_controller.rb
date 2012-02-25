class StatsController < ApplicationController
	def index
		@stats
		
	end
	
	def user
		@thisisforuser = "Hello"
		@stats #foruser
		
		render('index')
	end
end