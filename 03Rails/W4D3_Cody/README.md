# App Academy Projects
====================
This was partially completed with [Cody](https://github.com/codymcnamara). See my related blog post [here](http://blog.cssherry.com/post/107495491729/w4d3-authenticating-users-and-creating-sessions).

### W4D3
* Cookies
* Controllers and State
* CSRF and Forms
* displaying validation errors, flash
* Authentication: Creating Users and Sessions

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
