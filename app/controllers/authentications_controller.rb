class AuthenticationsController < ApplicationController

def index
 #@token = ActiveSupport::JSON.decode(session[:token])
 @token = params['token']
 
 #base_uri "https://rpxnow.com/api/v2/auth_info"
 
 
 
 #render(:template=>'home/index')
end

def create

end

def destroy

end

end
