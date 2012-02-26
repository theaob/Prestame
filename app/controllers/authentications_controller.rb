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
	@name = info['name']
	session[:name] = @name;
	flash[:message] = "Data was saved successfully"
	render(:template=>'home/index')
	#render :text => "Auth: #{auth} | UID : #{uid} | Name #{@name}"
end

def logout
	session[:name] = nil
	flash[:message] = "Logged out"
	render(:template=>'home/index')
end


end
