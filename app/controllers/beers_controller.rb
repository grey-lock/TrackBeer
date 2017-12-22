class BeersController < ApplicationController
  
  # If: logged_in? @user = current_user, load users beers. Else: redirect /login #
  get '/beers' do
    if logged_in? && current_user
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

  # If logged_in? and Beer's user is valid: Find beer by ID, load edit form. Otherwise load beer show page if not correct user. Else: /login #
  get "/beers/:id/edit" do
    set_beer
    if logged_in? && @beer.user == current_user
      erb :"/beers/edit.html"
    elsif logged_in? && @beer.user != current_user
      redirect "/beers/#{@beer.id}"
    else
      redirect '/login'
    end
  end

  # If logged_in? && beer has a name, update the name + attributes, redirect to that beer page. Else: Reload edit form #
  patch "/beers/:id" do
    if logged_in? && current_user
      set_beer
      @beer.update(params[:beer]) # Mass update the beer attributes
      @beer.brewery.update(params[:brewery]) # Mass update brewery attributes
      redirect "/beers/#{@beer.id}"
    else
      flash[:message] = @user.errors.messages
      redirect "/beers/#{params[:id]}/edit"
    end
  end

  # Delete beer if logged_in? and current_user is the creator. Otherwise, load beer index page. Else: reload /login #
  delete "/beers/:id/delete" do
    if logged_in?
      set_beer
      if @beer.user_id == current_user.id
        @beer.delete
        redirect '/beers'
      else
        redirect '/beers'
      end
    else
      redirect '/login'
    end
  end
  
  private
  
  def set_beer
    @beer = Beer.find_by_id(params[:id])
  end
end
