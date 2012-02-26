class AuthenticationsController < ApplicationController
#require 'wrest'
#require 'cgi'
require 'yaml'
def index
 #@token = ActiveSupport::JSON.decode(session[:token])
 #@token = params['token']
 
 #params = { :apiKey => "1585662eb5a9b49188100482818027976adf948b", :token => @token }
 #url = URI.parse("https://rpxnow.com/api/v2/auth_info")


end

def create
	#render :text => 
	auth = YAML::load(request.env['omniauth.auth'].to_yaml)
	uid = auth['uid']
	info = auth['info']
	provider = auth['provider']
	@name = info['name']
	session[:name] = @name;
	session[:provider] = provider
	avail = Authentication.find_by_uid(uid)
	
	if avail
		session[:user_id] = avail.user_id
		flash.now[:notice] = "Logged in"
		render(:template=>'home/index')
	else
		user = User.new(:name=>@name,:email=>"")
		if user.save
			session[:user_id] = user.id
			login = Authentication.new(:user_id=>user.id,:provider=>provider,:uid=>uid)
			if login.save
				flash[:notice] = "Please enter your email address"
				redirect_to(:controller=>'users',:action=>'edit', :id=>user.id)
				#render(:template=>'users/edit')
			else
				flash.now[:notice] = "Please enter your email address"
				#render(:template=>'home/index')
			end
		else
			session[:user_id] = user.id
			flash.now[:notice] = "Logged in but user was not created"
			render(:template=>'home/index')
		end
	end
	
	
	#render :text => "Auth: #{auth} | UID : #{uid} | Name #{@name} | Provider #{provider}"
end

def logout
	session[:name] = nil
	session[:user_id] = nil
	flash[:notice] = "Logged out"
	render(:template=>'home/index')
end


end
