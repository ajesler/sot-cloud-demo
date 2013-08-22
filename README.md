sot-cloud-demo
==============

This demo assumes you are on a unix machine, with ruby 1.9.3 and git installed. 
May work with other versions of ruby, but untested.

```bash
# you may have to sudo the following line, depending on your ruby configuration.
gem install sinatra aws-sdk heroku

git clone https://github.com/ajesler/sot-cloud-demo.git
cd sot-cloud-demo

# set the environment variables. You will need to get these and make sure they are available in your shell.
# assumes the following are available
export aws_access_key=XXXXXXXXXXXXXXXXXXXX
export aws_secret_key=XXXXXXXXXXXXXXXXXXXXXXXXX
export sqs_queue_name=sotdemo

ruby cloudifiable.rb
```
Now point your browser to http://localhost:4567


To check the environment variables have been set correctly on the local machine, visit localhost:4567/env and make sure each variable has a value.


Heroku Deploy
---

Sign up for an account at heroku.com

```bash
# make sure you are in the sot-cloud-demo directory

heroku login

heroku create
# heroku create output should include a url like http://powerful-spire-2161.herokuapp.com/

git push heroku master

heroku open
```

If you enter your number, and click submit, you will get an internal server error.
To find out why, we need to look at the Heroku logs. 
`heroku logs`

If you scroll up, we can see that the failure is due to AWS complaining about missing credentials.

To add the credentials:

```bash
heroku config:set aws_access_key=<access_key>
heroku config:set aws_secret_key=<secret_key>
heroku config:set sqs_queue_name=sotdemo
```

Now make sure they are set
`heroku config`

Now try submit your number again, and it should work.
