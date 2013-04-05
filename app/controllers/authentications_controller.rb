class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create

    auth_hash = request.env["omniauth.auth"] || session[:omniauth]
    puts "###########################################"
    puts "auth_hash : " + auth_hash["provider"] + " and " + auth_hash["uid"]
    puts "############################################"
    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || Authentication.create_with_omniauth(auth_hash)
    if authentication.user
      user = authentication.user 
      authentication.update_token(auth_hash)
      @next = root_url
      @notice = "Signed in!"
    else
      if current_user
        current_user.authentications << authentication
        @next = root_url #edit_user_password_url(user)   
        @notice = "Service is Added..."
      elsif auth_hash["extra"]["raw_info"]["email"]
         user = User.create_with_auth_and_hash(authentication,auth_hash)
        @next = root_url #edit_user_password_url(user)   
        @notice = "User created - confirm or edit details..."
        
      else
        session[:omniauth] = auth_hash.except('extra')
        @next = {:controller => 'authentications', :action => 'no_email'}
        @notice = "We require an email address."
      end
      
    end
    sign_in(user)
    redirect_to @next, :notice => @notice

  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end
  
  def no_email
    @user = User.new
  end
  
  def create_with_email
    @user = User.new
    @user.email = params[:user][:email]
    if @user.save
      sign_in(@user)
			self.create
		else
			render('no_email')
		end
  end
end
