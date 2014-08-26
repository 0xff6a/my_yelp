Week 8 @ Makers Academy: Introduction to Rails - Cloning Yelp
============

Hosted on heroku: http://protected-coast-1785.herokuapp.com/

Ruby Version
------------

Ruby 2.1.2

Technologies used:
------------------
- Ruby on Rails
- JavaScript
- jQuery & jQuery UI
- RSpec & Capybara for testing Ruby components
- Poltergeist for testing JavaScript components
- Postgres DB

Functionality:
-------------
- Home page displays a list of restaurants and associated reviews
- Users can create a profile and log in to the site
- Logged in users can submit restaurants for review
- Logged in users can review a submitted restaurant
- Average user rating is displayed for each restaurant using the star system
- Validation ensures users cannot post multiple reviews, review restaurants they have created or edit/delete restaurants created by other users
- Users can give a review a thumbs up or thumbs down
- Reviews are displayed based on their ranking derived from thumbs up vs down
- Validations ensure users can give the same review multiple thumbs up/down

Notes:
------
- Used jQuery UI to display review form and new restaurant form as a pop up from the homepage
- Styling is a tribute to CSS Zen Garden
- PostgresSQL must be installed to run the application
- Devise gem is used for user management

Running the application
-----------------------
- bin/rails server in CLI will open the app on port 3000
- rspec in CLI from the root directory will run the test suite
- bin/rake db:seed will seed the database with sample entries to demonstrate functionality



