class UserMailer < ActionMailer::Base
  default from: "no-reply@prestame.herokuapp.com"
	def test_mail(user)
		mail(:to=>user.email,:subject=>"Testing")
		
	end


end
