class AuthenticationsController < ApplicationController
#require 'wrest'
#require 'cgi'
def index
 #@token = ActiveSupport::JSON.decode(session[:token])
 @token = params['token']
 
 #params = { :apiKey => "1585662eb5a9b49188100482818027976adf948b", :token => @token }
 #url = URI.parse("https://rpxnow.com/api/v2/auth_info")


end

def create
	render :text => request.env['omniauth.auth'].to_yaml

end

def destroy

end


end
