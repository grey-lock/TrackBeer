# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
  - Utilizes an MVC pattern
- [x] Use ActiveRecord for storing information in a database
  - Models inherit from ActiveRecord::Base
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
  - Added User, Beer, and Brewery models
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
  - User has_many :beers, User has_many :breweries
- [ ] Include user accounts
- [ ] Ensure that users can't modify content created by other users
- [ ] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- [x] Include user input validations
  - Users must enter a unique email, unique username, and a password of length < 6
- [ ] Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
