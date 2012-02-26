class UsersController < ApplicationController
	
	def create
		
		
		
	end
	
	def stats
		
		redirect_to(:controller=>'stats',:action=>'user')
	end
	
	def edit
		if(session[:user_id])
			id = session[:user_id]
			@user = User.find_by_id(id)
		end
	end
	
	def update
		id = session[:user_id]
		@user = User.find_by_id(id)
		
		if(@user.update_attributes(params[:user]))
			session[:name]=@user.name
			flash[:success] = "User profile updated"
			redirect_to(:controller=>'home',:action=>'index')	
		else
			flash[:error] = "Profile couln't be updated. Try again"
			redirect_to(:action=>'edit',:id=>id)
		end
		
		
	end
end
