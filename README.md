autoadvisor
===========

Installation requirements.
-------------------------

You'll need `git` and ruby version 1.9.3. From there, use `gem` to install rails. Then, check out this repository and isntall the rest of the dependencies with `bundle install`. The mysql dependency is only required for testing the production environment on the local machine; everyone should be able to test just fine with sqlite.

If you run on Ubuntu, you may get success with this command: it works on a fully updated Xubuntu install of 12.10:

    wget  https://raw.github.com/Auto-Advisor/autoadvisor/master/misc/ubuntu_boot.sh -O ./ubuntu_boot.sh && bash ./ubuntu_boot.sh

This will install git, gcc, mysql, ruby, sqlite, nodejs, rails, and all the requirements necessary to work on the project. It will prompt you for your password which is sudo asking for permission (I recommend reading the source before piping it through bash), as well as ask you for a password for mysql (I recommend 'password' for local testing, as that is what `fake_prod.sh` expects). After you're done, if you type `rails server -e development` in the root of the directory, then you should have a server running at http://localhost:3000/.


Maintenance instructions.
-------------------------
These are commands you should run ALL THE TIME. Before you push your changes to the main repository, it is REQUIRED to run:

    git pull
    bundle update && bundle install
    rake db:migrate

The above should be run without problems, and the existing site should work fine before committing.

Running the server locally.
---------------------------

Because autoadvisor.elasticbeanstalk.com is our production server, do not test there and do not push changes to the server without being absolutely sure you're not going to break something. Testing is as simple as running `rails server` from somewhere in the repository, and `rails server -e production` to test production; however, the latter requires a local mysql instance. If you decide to do that, then run `source ./fake_prod.sh` in the root of the repository to fake the environment elastic beanstalk uses. Therefore, you run the server locally in production mode with:

    source ./fake_prod.sh
    rails server -e production

Database access
---------------

Because development setups use sqlite3, accessing the database is as simple as running `sqlite db/development.sqlite3`.

Accessing Elastic Beanstalk
---------------------------

Access to elastic beanstalk requires the access credentials for our AWS account, which can be found on our mailing list. __DO NOT commit passwords, emails, or security credentials to this repository, it is public and will be public forever.__ Security credentials can be changed, but it's still a very bad idea. In the above `ubuntu_boot.sh`, this downloads the `eb` command referenced before to `./eb/AWS-ElasticBeanstalk-CLI-2.3.1/eb/linux/python2.7/eb` Therefore, you might run `alias eb="$PWD/eb/AWS-ElasticBeanstalk-CLI-2.3.1/eb/linux/python2.7/eb"` in the root of your source directory so `eb init` does what you might expect.
