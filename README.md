autoadvisor
===========

Installation requirements.
-------------------------

You'll need `git` and ruby version 1.9.3. From there, use `gem` to install rails. Then, check out this repository and isntall the rest of the dependencies with `bundle install`. The mysql dependency is only required for testing the production environment on the local machine; everyone should be able to test just fine with sqlite.

If you are on Mac OS X, I recommend using [Homebrew](http://mxcl.github.com/homebrew/) to install software. If you have homebrew installed, then you can just say:

     brew install git ruby && gem install rails && git checkout git@github.com:Auto-Advisor/autoadvisor.git && cd autoadvisor && rails generate bootstrap:install


Maintenance instructions.
-------------------------

These are commands you should run ALL THE TIME. Before you push your changes to the main repository, it is REQUIRED to run:

    git pull
    bundle update && bundle install
    rake db:migrate

Running the server locally.
---------------------------

Because autoadvisor.elasticbeanstalk.com is our production server, do not test there and do not push changes to the server without being absolutely sure you're not going to break something. Testing is as simple as running `rails server` from somewhere in the repository, and `rails server -e production` to test production; however, the latter requires a local mysql instance. In addition, Elastic Beanstalk usees Passenger, so you may want to install that separately and use that if you have a problem with WEBrick. If you do use MySQL, please prepare your environment by running the following (except for your computer's details):

    export RDS_USERNAME="root"
    export RDS_PASSWORD="1205c9c1302383b34f5f915da155e9ed"
    export RDS_HOSTNAME="127.0.0.1"
    export RDS_PORT="3306"

Database access
---------------

Because development setups use sqlite3, accessing the database is as simple as running `sqlite db/development.sqlite3`.

Accessing Elastic Beanstalk
---------------------------

Access to elastic beanstalk requires the access credentials for our AWS account, which can be found on our mailing list. __DO NOT commit passwords, emails, or security credentials to this repository, it is public and will be public forever.__ Security credentials can be changed, but it's still a very bad idea.