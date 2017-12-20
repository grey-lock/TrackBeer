class UsersController < ApplicationController
  use Rack::Flash
  
  # If not logged_in? Load Signup form, else load user index #
  get '/signup' do
    if !logged_in?
      erb :'/users/new.html'
    else
      redirect '/users/index.html'
    end
  end
  
  # If: any empty fields => load /signup again. Else: Create the user with params, assign session[:user_id] to user, load /users #
  # If: unable to save username || email to database, display error message, reload signup page
  post '/signup' do
    if params[:username].empty? || params[:email].empty? || params[:password].empty?
      redirect '/signup'
    else
      @user = User.new(username: params[:username], email: params[:email], password: params[:password])
      if @user.save
        session[:user_id] = @user.id
        redirect '/beers'
      else 
        flash[:message] = @user.errors.messages
        redirect '/signup'
      end
    end
  end
  
  # If logged_in? redirect to /tweets, otherwise redirect to /login #
  get '/login' do
    if logged_in?
      redirect '/beers'
    else
      erb :'/login'
    end
  end

  # Find user by username, if exists && password is authenticated, assign session[:user_id] to user, load /users. Else: load /login #
  post '/login' do
    @user = User.find_by(username: params[:username])
    
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/beers'
    else
      flash[:message] = { "Error: ":"You username and/or password do not match our records."} # Keep this ambiguous for security purposes #
      redirect '/login'
    end
  end
  
  # If logged_in?: Logout, redirect to /login. Else redirect to / #
  get '/logout' do
    if logged_in?
      logout!
      redirect '/login'
    else
      redirect '/'
    end
  end
  
  # GET: /users
  get "/users" do
    if logged_in?
      erb :'/users/index.html'
    else
      flash[:message] = @user.errors.messages
      redirect '/login'
    end
  end

  # # GET: /users/new
  # get "/users/new" do
  #   erb :"/users/new.html"
  # end

  # POST: /users
  post "/users" do
    redirect "/users"
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
  
end
