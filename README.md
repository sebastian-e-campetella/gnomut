# About gnomut

Test dna mutant 

 ## gnomut is an API Restful web application with attributes and basic methods:

  ## Attributes
    - dna type array of string
    - is_mutant type boolean
  
   ### Attributes required
     - dna
   
   #### Attributes read only.
   
     - is_mutant
     
  ## Endspoint
  
    - stats
       Return data count human, mutant and ratio of mutant.
    - mutant
       Verify dna array and store
       
 ## Requirements

If you want use this application, you need preinstall some tools. Here a list of tools:

- Mongodb 
  - Mongodb engine [Install instructions](https://docs.mongodb.com/manual/installation/)
  
- RAILS
   List of most important [gems](https://rubygems.org/) requeriments and modified version of RoR:
   
   - Ruby >= ruby 2.4.3p205
   - mongo-id Extension
   - rspec-rails test Extension
   - simplecov 
   - rails-controller-testing
   - database_cleaner
   - factory_bot_rails
   - mongo
   - mongoid
   - responders
  

 ## Use best practices and standards
 
- code coverage
- test
- methods dry and clear code
- [Rails](https://rubyonrails.org/). Is the most popular framework ruby based.


## Cloning and run project

for "*nxgx" environments you can get code with next commands:

```
user:yourpath$ git clone https://github.com/sebastian-e-campetella/gnomut
user:yourpath$ cd your_project_folder
user:yourpath$ bundle install
user:yourpath$ rails server

```

.... and  enjoy!

## Testing

You maybe run test, you do use next code:

```
 user:path$  rake spec
```
This command output coverage into coverage folder on root project folder

and I share curl code for your first request.

```
user:path$ curl -i -H "Accept: application/json" -H "Content-type:  application/json" -X POST -d '{"dna":["aaaaa","ccaaa","cdaav","ccaaq","ccaaa"]}' http://localhost:3000/mutant

user:path$ curl -i -X GET  http://localhost:3000/stats

```
### Configuration
  if you want to change this configurations it's rigth. by default configuration:

  mongodb server configuration and mongoid.yml configuration:
    ```
    PORT: 27017
    HOST: 127.0.0.1
    ``` 
### Database creation
  you do need run next commands:
  ```
  rake db:create db:migration
  ```
###  Deployment instructions
  This project run over gcloud services, the configurarion for delploy is in app.yml file.
  Make sure your glcoud sdk are installed in your computer
 
  You need run next commends:
  ```
    gloud create app
    gcloud deploy app
  ```



## Contributing

Thank you for considering contributing to the gnomut API!.
