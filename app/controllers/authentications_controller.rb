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
	authenticate = Authentication.find_by_uid(uid).first
	if authenticate
		flash.now[:notice] = "Logged in a var"
		render :text => "Auth: #{authenticate} | UID : #{uid} | Name #{@name} | Provider #{provider}"
		#render(:template=>'home/index')
	else
		flash.now[:notice] = "Logged in a yok"
		render :text => "Auth: #{authenticate} | UID : #{uid} | Name #{@name} | Provider #{provider}"
		#render(:template=>'home/index')
	end
	
	
	
	
	#render :text => "Auth: #{auth} | UID : #{uid} | Name #{@name} | Provider #{provider}"
end

def logout
	session[:name] = nil
	flash[:notice] = "Logged out"
	render(:template=>'home/index')
end


end
