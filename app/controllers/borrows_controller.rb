class BorrowsController < ApplicationController
	
	def index
		redirect_to(:action=>'list')
	end
	
	def create
		if(session[:user_id])
			@borrow = Borrow.new(params[:borrow])
			@borrow.user_id = session[:user_id]
			if @borrow.save
				flash[:success] = "New Lending Added"
				redirect_to(:action=>'list')
			else
				flash.now[:error] = "Borrowing could not be saved"
				render('new')
			end
		end
	end
	
	def new
		if(!session[:user_id])
				flash[:error] = "You have to login first!"
				redirect_to(:controller=>'home',:action=>'index')
		end
		
	end
	
	def list
		if(session[:user_id])
			@borrows = Borrow.where(:user_id=>session[:user_id])
		end
	end
	
	def active
		if(session[:user_id])
			@borrows = Borrow.where(:paid=>false);
			render('list')
		end
	end
	
	def completed
		if(session[:user_id])
			@borrows = Borrow.where(:paid=>true);
			render('list')
		end
	end
end
