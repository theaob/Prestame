class UserMailer < ActionMailer::Base
  default from: "no-reply@prestame.herokuapp.com"
	
	def add_borrow(borrow)
		@user = User.find(borrow.user_id)
		@borrow = borrow
		if(@user.email)
			mail(:to=>@user.email,:subject=>"You've added a new lending")
		end
	end
	
	def delete_borrow(borrow)
		@user = User.find(borrow.user_id)
		@borrow = borrow
		if(@user.email)
			mail(:to=>@user.email,:subject=>"You've deleted a lending")
		end
	end

	def borrow_paid(borrow)
		@user = User.find(borrow.user_id)
		@borrow = borrow
		if(@user.email)
		mail(:to=>@user.email,:subject=>"You Got Paid")
		end
	end

end
