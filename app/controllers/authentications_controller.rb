class AuthenticationsController < ApplicationController
#require 'wrest'
#require 'cgi'
def index
 #@token = ActiveSupport::JSON.decode(session[:token])
 @token = params['token']
 
 #params = { :apiKey => "1585662eb5a9b49188100482818027976adf948b", :token => @token }
 #url = URI.parse("https://rpxnow.com/api/v2/auth_info")

 @response = 'https://rpxnow.com/api/v2/auth_info'.to_uri.get(
              :apiKey  => '1585662eb5a9b49188100482818027976adf948b', 
              :token => @token
            ).deserialise
end

def create

end

def destroy

end

end
