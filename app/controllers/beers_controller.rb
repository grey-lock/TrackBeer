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

  # GET: /beers/new
  get "/beers/new" do
    erb :"/beers/new.html"
  end

  # POST: /beers
  post "/beers" do
    redirect "/beers"
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
