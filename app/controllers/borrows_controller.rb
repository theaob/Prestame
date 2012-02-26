class BorrowsController < ApplicationController
	
	def delete
		if(!session[:user_id])
				flash[:error] = "You have to login first!"
				redirect_to(:controller=>'home',:action=>'index')
		end
		if(params[:id])
			#borrow = Borrow.where("id = ?", params[:id])
			borrow = Borrow.find(params[:id])
			if (borrow.user_id==session[:user_id])
				borrow.destroy
				flash[:success] = "Lending is deleted"
				redirect_to(:action=>'list')
			else
				flash[:error] = "You can only delete your lendings"
				redirect_to(:action=>'list')
			end
		else
			flash[:error] = "Couldn't get lending ID"
			redirect_to(:action=>'list')
		end
	end
	
	
	def pay
		if(!session[:user_id])
				flash[:error] = "You have to login first!"
				redirect_to(:controller=>'home',:action=>'index')
		end
		if(params[:id])
			#borrow = Borrow.where("id = ?", params[:id])
			borrow = Borrow.find(params[:id])
			if (borrow.user_id==session[:user_id])
				borrow.paid = !borrow.paid
				borrow.save
				flash[:success] = "Lending is marked paid"
				redirect_to(:action=>'list')
			else
				flash[:error] = "You can only mark your lendings"
				redirect_to(:action=>'list')
			end
		else
			flash[:error] = "Couldn't get lending ID"
			redirect_to(:action=>'list')
		end
		
	end
	
	
	def edit
		if(!session[:user_id])
				flash[:error] = "You have to login first!"
				redirect_to(:controller=>'home',:action=>'index')
		end
		if(params[:id])
			#borrow = Borrow.where("id = ?", params[:id])
			@borrow = Borrow.find(params[:id])
			if (!@borrow.user_id==session[:user_id])
				flash[:error] = "You can only edit your lendings"
				redirect_to(:action=>'list')
			end
		else
			flash[:error] = "Couldn't get lending ID"
			redirect_to(:action=>'list')
		end
	end
	
	def update
		if(!session[:user_id])
				flash[:error] = "You have to login first!"
				redirect_to(:controller=>'home',:action=>'index')
		end
		if(params[:id])
			#borrow = Borrow.where("id = ?", params[:id])
			borrow = Borrow.find(params[:id])
			if (borrow.user_id==session[:user_id])
				borrow.update_attributes(params[:borrow])
				flash[:success] = "Lending is updated"
				redirect_to(:action=>'list')
			else
				flash[:error] = "You can only update your lendings"
				redirect_to(:action=>'list')
			end
		else
			flash[:error] = "Couldn't get lending ID"
			redirect_to(:action=>'list')
		end
	end
	
	
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
				flash.now[:error] = "Couldn't save new lending"
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
