# App Academy Projects
====================
This was partially completed with [Bryce](https://github.com/byoung1018), partially solo. See my related blog post [here](http://blog.cssherry.com/post/106694996074/w3d4-activerecord-advanced).

### W3D4
* ActiveRecord::Relation
* ActiveRecord and Joins
* Scopes

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
