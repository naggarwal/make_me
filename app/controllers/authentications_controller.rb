class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    auth_hash = request.env["omniauth.auth"]
 
    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || Authentication.create_with_omniauth(auth_hash)
    if authentication.user
      user = authentication.user 
      authentication.update_token(auth_hash)
      @next = root_url
      @notice = "Signed in!"
    else
      user = User.create_with_auth_and_hash(authentication,auth_hash)
      @next = root_url #edit_user_password_url(user)   
      @notice = "User created - confirm or edit details..."
    end
    sign_in(user)
    redirect_to @next, :notice => @notice

  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end
end
