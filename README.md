# Bookmark Manager

### Purpose
Project to create a bookmark manager that allows users to save frequenty visited sites, add tags to a saved link, search for links by tag.

### User Stories
```
As a time-pressed user
So that I can quickly go to web sites I regularly visit
I would like to see a list of links on the homepage

As a time-pressed user
So that I can save a website
I would like to add the site's address and title to my bookmark manager

As a time-pressed user
So that I can organise my many links into different categories for ease of search
I would like to tag links in my bookmark manager

As a time-pressed user
So that I can quickly find links on a particular topic
I would like to filter links by tag

As a time-pressed user
So that I can organise my links into different categories for ease of search
I would like to add tags to the links in my bookmark manager

As a user
So that I can reset my password
I would like to recover my password if I forget it

As a user
So that I can ensure only I am resetting my password
I would like a password token to be valid for one hour only
```

### Set Up
1. Fork this repository
2. Clone repository to local machine
3. Use `bundle` command to ensure all required gems have been installed
4. Create two PostgreSQL databases, `bookmark_manager_development` and `bookmark_manager_test`
5. Run local server using `rackup` command (and navigate to localhost in browser), or deploy to Heroku

### How to Use
1. Navigate to sign up page, signing up with email, password and password confirmation
2. Provided email is unique, and password/password confirmation match, the user is taken to list of links
3. User can create a bookmark by clicking on the "Create Bookmark" button
4. User provides the title, URL and tags associated with bookmark/link

### Technology Used
* Ruby
* Sinatra
* HTML/CSS
* RSpec, Capybara, for testing
* BCrypt, for password hashing
* Database Cleaner, to ensure clean testing
* PostgreSQL, for databases
* DataMapper, for ORM
* Sinatra-flash, for flash notifications

### Outstanding Features
User interface is currently not complete visually. It also does not yet allow a user to search for links using tags. Potential to improve workflow by introducing password recovery and emailing tokens.
