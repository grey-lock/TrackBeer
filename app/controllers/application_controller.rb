require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  
  configure do
    enable :sessions unless test?
    set :session_secret, "beer_is_sick" # TODO: generate sysrandom session secret in ENV
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end
  
  ## Helpers ##
  
  private 
  
  helpers do 
    
    # Double bang current_user means they aren't logged in #
    def logged_in?
      !!current_user
    end
    
    # Find the current_user by finding their session[:user_id] if one exists #
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    # Logout method to clear the session #
    def logout!
      session.clear
    end
    
  end

end
