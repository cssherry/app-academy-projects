# App Academy Projects
====================
This was completed with [Yifan](https://github.com/jiang-yifan). See my related blog post [here](http://blog.cssherry.com/post/107972737419/w5d1-rails-integrative-testing).

### W5D1
* RSpec and Rails Setup
* Testing Models
* FactoryGirl and Faker Gems
* Integration Testing with Capybar

# How to Run These Files
These files require Ruby to run. The best ruby tutorial I've found is this: [Ruby Installation Tutorial](http://installrails.com/steps).

Once Ruby is installed, download the files, go into terminal, navigate to the polls_app folder, $ bundle install, and play with it via the rails console.

First, create the databases
$ rake db:create

Then, run the migrations
$ rake db:migrate

Then seed the database
$ rake db:seed

Then play around in the app
$ rails c
