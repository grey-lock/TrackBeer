require './config/environment'

class ApplicationController < Sinatra::Base
  
  
  configure do
    enable :sessions unless test?
    set :session_secret, "super_secure_session_secret" # TODO: generate random session secret in ENV
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

end
