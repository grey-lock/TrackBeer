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
    if logged_in?
      @beer = Beer.new(name: params[:beer_name])
      @beer.abv = params[:abv]
      @beer.style = params[:style]
      @beer.color = params[:color]
      @beer.rating = params[:rating]
      @beer.comments = params[:comments]
      @beer.user_id = current_user.id
      
      if !params[:brewery_name].empty?
        @beer.brewery = Brewery.find_or_create_by(name: params[:brewery_name])
        @beer.brewery.town = params[:town]
        @beer.brewery.state_or_region = params[:state_or_region]
        @beer.brewery.country = params[:country]
        @beer.brewery_id = @beer.brewery.id
        @beer.brewery.save
      end
      
      @beer.save
      redirect "/beers/#{@beer.id}"
    else
      redirect 'beers/new.html'
    end
  end

  # If logged_in, show the beer by finding the ID. Else: force /login page #
  get "/beers/:id" do
    if logged_in?
      set_beer
      erb :"/beers/show.html"
    else
      redirect '/login'
    end
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
  
  private
  
  def set_beer
    @beer = Beer.find(params[:id])
  end
end
