class UsersController < ApplicationController
  
  # If not logged_in? Load Signup form, else load user index #
  get '/signup' do
    # if !logged_in? # BUG: ERROR => breaking when user_id is not found even with condition to set if only it exists
      erb :'/users/new.html'
    # else
    #   redirect '/users/index.html'
    # end
  end
  
  post '/signup' do
    if params[:username].empty? || params[:email].empty? || params[:password].empty?
      redirect '/signup'
    else
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
      redirect '/users'
    end
  end
  
  # If logged_in? redirect to /tweets, otherwise redirect to /login #
  get '/login' do
    if logged_in?
      redirect '/users'
    else
      erb :'/users/login'
    end
  end

  # Find user by username, if exists && password is authenticated, assign session[:user_id] to user, load /tweets. Else: load /login #
  post '/login' do
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/users'
    else
      redirect '/login'
    end
  end
  
  # GET: /users
  get "/users" do
    erb :"/users/index.html"
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
