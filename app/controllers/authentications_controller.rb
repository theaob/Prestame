class AuthenticationsController < ApplicationController
def index
 @currentuser = session
 puts @currentuser
 #render(:template=>'home/index')
end

def create
  auth = request.env["rack.auth"]
  current_user.authentications.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
  flash[:notice] = "Authentication successful."
  redirect_to authentications_url
end

def destroy
  @authentication = current_user.authentications.find(params[:id])
  @authentication.destroy
  flash[:notice] = "Successfully destroyed authentication."
  redirect_to authentications_url
end
end
