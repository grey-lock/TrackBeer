# TrackBeer

TrackBeer is a Sinatra web application built in Ruby that allows you to keep track of your favorite beers. 

Users can signup with a unique username, email, and password to create an account. 

Once a user has signed up, users can login to their account in order to Create, Read, Update, and Delete information about their specific beer using RESTful routes.

Users can add/edit beer information such as Name, A.B.V, Style, Color, Rating, and add comments/notes about the beer.

Users can also add Brewery information such as Name, Town, State/Region, and Country.

Only users that created the beer can edit or delete the information for that beer. Currently all beers that are created are viewable if an account is logged in.


## Installation

Fork and clone this repository, and then execute:

    $ bundle install

    $ rake db:migrate

Then run:

    $ shotgun

Open up a new browser window and navigate to:

    localhost:9393
    
Then you can signup, login, and add some beers!
    
