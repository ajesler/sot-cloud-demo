sot-cloud-demo
==============

```bash
# assumes ruby 1.9.3 is installed and available
gem install sinatra aws-sdk

git clone https://github.com/ajesler/sot-cloud-demo.git
cd sot-cloud-demo

# set the environment variables. You will need to get these and make sure they are available in your shell.

ruby cloudifiable.rb

Point your browser to http://localhost:4567

```

To check the environment variables have been set correctly on the local machine, visit localhost:4567/env and make sure each variable has a value.


=== Heroku Deploy

Sign up for an account at heroku.com

```bash
# download the heroku toolbelt
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# make sure you are in the sot-cloud-demo directory

heroku login

heroku create
# heroku create output should include a url like http://powerful-spire-2161.herokuapp.com/

git push heroku master

heroku open
```