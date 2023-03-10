# AW-test-api

#### Link to the api collection 

- Get [API COLLECTION](https://elements.getpostman.com/redirect?entityId=9462682-eea4feb6-7937-4b89-a8e7-9c409b4026ac&entityType=collection)


### Additional gems used

#### Faker 

Used to generate fake records.[Read more](https://github.com/faker-ruby/faker)

#### factory_bot_rails

Used to create test data while writing test spec for model and controller.
[read more](https://github.com/thoughtbot/factory_bot_rails)

#### Fast_jsonapi

Used to searilize data in standard format. [read more](https://github.com/jsonapi-serializer/jsonapi-serializer)

#### rspec-rails 

Used to generate model spec and request spec and spec tests. [read more](https://github.com/rspec/rspec-rails)


#### shoulda-matchers

Used to model validation and assciation. [read more](https://github.com/thoughtbot/shoulda-matchers)

#### jwt

Used for token based authentication. [read more](https://github.com/jwt/ruby-jwt)

#### bcrypt

Used to encrypt the `passwords` in the database and also provides method to authenticate.[read more](https://github.com/bcrypt-ruby/bcrypt-ruby)

### Some modification in project model

Since, the project  attribute name `type` was not achieved since it was the reserved keyword. So, `type` attribubte was change to `project_type`.

### Some modification in postman  user signup POST request

In the api specification form date are sent like this

```sh

{
  "firstName": "example_fname",
  "lastName": "example_lname", 
  "email": "example@gmail.com",
  "password": "example_password",
  "country": "example_country"
}

```
but instead of sending data like above I prefered sending data like this and using strong params to filter out the data as per need.

``` sh 

{
    "user":{
      "firstName": "example_fname",
      "lastName": "example_lname", 
      "email": "example@gmail.com",
      "password": "example_password",
      "country": "example_country"
    }
}

```

### System dependencies

#### Prerequisites

  The setups steps expect following tools installed on the system.

  * Git
  * Ruby 2.7.2
  * Rails 7.0.4.2
  * Docker latest version [install](https://docs.docker.com/engine/install/ubuntu/)


## Project Setup in your machine

1. Clone the repo to your local machine

```sh

git clone https://github.com/mukeshmahara/AW-test-api.git

```

2. Generate rails credentials 

```sh

EDITOR="code --wait" /bin/rails credentials:edit

```
3. Create `.env` file in root directory and `Paste` the code below

```sh

RAILS_ENV=production

POSTGRES_HOST=db

POSTGRES_DB=angelswingdb_production

POSTGRES_USER= dbuser12

POSTGRES_PASSWORD= dbpassword12

RAILS_MASTER_KEY= master_key

```
5. Find `master.key` file and `copy` the key

6. `paste` the RAILS_MASTER_KEY in .env file

7. Build and run docker image

```sh

sudo docker compose build && docker compose up

```
8. Open  any api testing tool, (Recomended [Postman](https://www.postman.com/downloads/)) and start testing API

> Yeah, that's it!

> **NOTE** 
>If your postgres database in your local machine is running at port 5432 you might encounter the error in that case stop your local postgres

```sh 

  systemctl stop postgresql
  
```

