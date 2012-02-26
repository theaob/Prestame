class BorrowsController < ApplicationController
	
	def new
		
		
	end
	
	def index
		redirect_to(:action=>'list')
	end
	
	def create
		@borrow = Borrow.new(params[:borrow])
		@borrow.user_id = session[:user_id]
		if @borrow.save
			
			redirect_to(:action=>'list')
		else
			flash.now[:error] = "Borrowing could not be saved"
			render('new')
		end
		
	end
	
	def list
		@borrows = Borrow.all
		
	end
	
	def active
		@borrows = Borrow.where(:paid=>false);
		render('list')
	end
	
	def completed
		@borrows = Borrow.where(:paid=>true);
		render('list')
	end
end
