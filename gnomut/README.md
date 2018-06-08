# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  ruby 2.4.3p205

* System dependencies
  mongodb server

* Configuration
  if you want to change this configurations it's rigth. by default configuration:

  mongodb server
    PORT: 27017
    HOST: 127.0.0.1
    
* Database creation
  you do need run next commands
  rake db:create db:migration

* How to run the test suite
  Test the code, with: 
     rake rspec

* Deployment instructions
  This project run over gcloud services, the configurarion for delploy is in app.yml file.
  Make sure your glcoud sdk are installed in your computer
  
  You need run next commends:
    gloud create app
    gcloud deploy app

* ...
