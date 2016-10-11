class AuthController < ApplicationController
  def callback
   # access the provided user info provided by the OAuth provider
   provider_user = request.env['omniauth.auth']

  #  exisiting_user = User.find_by(email: provider_user['info']['email'])
  #  if exisiting_user.present?
  #    ...
  #  end


   # use provided user info to find or create the user in our own database
   # this populates fields for the user model we created
   user = User.find_or_create_by(provider_id: provider_user['uid'], provider: params[:provider]) do |u|
     u.provider_hash = provider_user['credentials']['token']
     u.first_name = provider_user['info']['name']
     u.email = provider_user['info']['email']
   end

   unless user.persisted?
     puts "there was an error in creating a new user"
   end

   puts user.first_name
   session[:user_id] = user.id
   redirect_to root_path
 end

 def logout
   session[:user_id] = nil
   redirect_to root_path
 end

 def failure
   #TODO: display error page
  #  render plain: 'this is a failure'
   redirect_to "/register"
 end

end
