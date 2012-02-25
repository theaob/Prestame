class BorrowsController < ApplicationController
	
	def new
		
		
	end
	
	def create
		@borrow = Borrow.new(params[:borrow])
		@borrow.user_id = session[:user_id]
		if @borrow.save
			
			redirect_to(:action=>'list')
		else
			
			render('new')
		end
		
	end
	
	def list
		
		
	end
end
