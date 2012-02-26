class BorrowsController < ApplicationController
	
	def index
		redirect_to(:action=>'list')
	end
	
	def create
		if(!session[:user_id])
				flash[:error] = "You have to login first!"
				redirect_to(:controller=>'home',:action=>'index')
		end
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
		if(!session[:user_id])
				flash[:error] = "You have to login first!"
				redirect_to(:controller=>'home',:action=>'index')
		end
		if(session[:user_id])
			@borrows = Borrow.where(:user_id=>session[:user_id])
		end
	end
	
	def active
		if(!session[:user_id])
				flash[:error] = "You have to login first!"
				redirect_to(:controller=>'home',:action=>'index')
		end
		
		@borrows = Borrow.where('paid = ? AND user_id = ?',false,session[:user_id]);
		render('list')
		
	end
	
	def completed
		if(!session[:user_id])
				flash[:error] = "You have to login first!"
				redirect_to(:controller=>'home',:action=>'index')
		end
		
		
		@borrows = Borrow.where('paid = ? AND user_id = ?',true,session[:user_id]);
		render('list')
		
			
	end
end
