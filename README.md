Week 8 @ Makers Academy: Introduction to Rails - Cloning Yelp
============

Ruby 2.1.2

Technologies used:
------------------
- Ruby on Rails
- JavaScript
- jQuery & jQuery UI
- RSpec & Capybara for testing
- Postgres DB

Functionality:
-------------
- Home page displays a list of restaurants and associated reviews
- Users can created a profile and log in to ths site
- Logged in users can submit restaurants for review
- Logged in users can review a submitted restaurant
- Average user rating is displayed for each restaurant using the star system
- Validation ensures users cannot post multiple reviews, review restaurants they have created or edit/delete restuarants created by other users

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

TO DO:
------
- Add endorsements -> each review has an upvote and downvote button. Reviews are ordered by their upvotes and downvotes
- Add endorsement validation - one user can only upvote or downvote once
- Endorsement association: belongs_to review, belons_to user
- Test in poltergeist
