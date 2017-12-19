class UsersController < ApplicationController
  
  # If not logged_in? Load Signup form, else load beers index #
  get '/signup' || '/users/new' do
    if !logged_in?
      erb :'/users/new.html'
    else
      redirect '/users'
    end
  end
  
  post '/signup' || '/users/new' do
    if params[:username].empty? || params[:email].empty? || params[:password].empty?
      redirect '/signup'
    else
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
      redirect '/users'
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
