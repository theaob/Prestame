class StatsController < ApplicationController
	def index
		@usercount = User.count
		@debtcount = Borrow.count
		@adebtcount = Borrow.where(:paid=>false).count
		@pdebtcount = Borrow.where(:paid=>true).count
		@tdebtamount = Borrow.sum("amount")
		@tadebtamount= Borrow.where(:paid=>true).sum("amount")
		@tpdebtamount = Borrow.where(:paid=>false).sum("amount")
		@debtavg = Borrow.average("amount")
		@intavg = Borrow.average("interest")
		@maxdebt = Borrow.maximum("amount")
		@maxint = Borrow.maximum("interest")
	end
	
	def user
		if(!session[:user_id])
				flash[:error] = "You have to login first!"
				redirect_to(:controller=>'home',:action=>'index')
		end
		@thisisforuser = "Hello"
		your_id = session[:user_id]
		@debtcount = Borrow.where(:user_id=>your_id).count
		@adebtcount = Borrow.where(:user_id=>your_id,:paid=>false).count
		@pdebtcount = Borrow.where(:user_id=>your_id,:paid=>true).count
		@tdebtamount = Borrow.where(:user_id=>your_id).sum("amount")
		@tadebtamount= Borrow.where(:user_id=>your_id,:paid=>true).sum("amount")
		@tpdebtamount = Borrow.where(:user_id=>your_id,:paid=>false).sum("amount")
		@debtavg = Borrow.where(:user_id=>your_id).average("amount")
		@intavg = Borrow.where(:user_id=>your_id).average("interest")
		@maxdebt = Borrow.where(:user_id=>your_id).maximum("amount")
		@maxint = Borrow.where(:user_id=>your_id).maximum("interest")
		
		
		render('index')
	end
end