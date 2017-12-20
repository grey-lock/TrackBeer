class BeersController < ApplicationController
  
  # If: logged_in? @user = current_user, load users beers. Else: redirect /login #
  get '/beers' do
    if logged_in?
      @user = current_user
      @beers = Beer.all
      erb :'/beers/index.html'
    else
      redirect '/login'
    end
  end

  # Check if user is logged in to add a new beer #
  get '/beers/new' do
    if logged_in?
      @user = current_user
      erb :'/beers/new.html'
    else
      redirect '/login'
    end
  end
  
  # User must be logged_in && params must be filled out to create an entry #
  post '/beers' do
    if logged_in? && params.all? { |v| v != "" }
      @beer = Beer.new(name: params[:name])
      @beer.abv = params[:abv]
      @beer.type = params[:type]
      @beer.brewery_name = params[:brewery_name]
      @beer.rating = params[:rating]
      @beer.comments = params[:comments]
      @beer.user_id = current_user.id
      
      @beer.save
      redirect "/beers/#{@beer.id}"
    else
      redirect 'beers/new.html'
    end
  end

  # GET: /beers/5
  get "/beers/:id" do
    erb :"/beers/show.html"
  end

  # GET: /beers/5/edit
  get "/beers/:id/edit" do
    erb :"/beers/edit.html"
  end

  # PATCH: /beers/5
  patch "/beers/:id" do
    redirect "/beers/:id"
  end

  # DELETE: /beers/5/delete
  delete "/beers/:id/delete" do
    redirect "/beers"
  end
end
