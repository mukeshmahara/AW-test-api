# AW-test-api

## Link to the api collection 

* Get [API COLLECTION](https://elements.getpostman.com/redirect?entityId=9462682-eea4feb6-7937-4b89-a8e7-9c409b4026ac&entityType=collection)


### Additional gems used

Faker [Read more](https://github.com/faker-ruby/faker)

factory_bot_rails [Read more](https://github.com/thoughtbot/factory_bot_rails)

Fast_jsonapi [Read more](https://github.com/jsonapi-serializer/jsonapi-serializer)

rspec-rails [Read more](https://github.com/rspec/rspec-rails)

shoulda-matchers [Read more](https://github.com/thoughtbot/shoulda-matchers)

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

POSTGRES_USER= any username

POSTGRES_PASSWORD= any password

RAILS_MASTER_KEY= <paste master key from master file>

```


4. Build and run docker image

```sh

sudo docker compose build && docker compose up

```
> **NOTE** 
>If your postgres database in your local machine is running at port 5432 you might encounter the error in that case stop your local postgres

```sh 

  systemctl stop postgresql
  
```

