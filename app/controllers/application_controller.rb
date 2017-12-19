require './config/environment'

class ApplicationController < Sinatra::Base
  
  
  configure do
    enable :sessions unless test?
    set :session_secret, "super_secure_session_secret" # TODO: generate sysrandom session secret in ENV
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end
  
  ## Helpers ##
  
  helpers do 
    
    # If logged in, not, not the current_user #
    def logged_in?
      !!current_user
    end
    
    # Find the current_user by finding their session[:user_id] if one exists #
    def current_user
      @current_user = User.find(session[:user_id]) if session[:user_id]
    end
    
    # Logout method to clear the session #
    def logout!
      session.clear
    end
    
  end

end
