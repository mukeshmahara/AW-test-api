# AW-test-api


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

[API Available ] "(https://api.postman.com/collections/9462682-eea4feb6-7937-4b89-a8e7-9c409b4026ac?access_key=PMAT-01GR8C1JPRAS18T0W7CE4JY0G3)"

* Ruby version 2.7.2

* System dependencies

* Configuration

* Database creation
create's database: `rails db:create`
create's table: `rails db:migrate`



* Database initialization
`rails db:seed`

* How to run the test suite
`rails s`

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

*  `sudo docker compose build && docker compose up`
*  `systemctl stop postgresql` 
*  `systemctl start postgresql` 

* Configuration
- RAILS_ENV=<environment name>
- POSTGRES_HOST=<pg host name>
- POSTGRES_DB=<your databse name password>
- POSTGRES_USER=<your db user>
- POSTGRES_PASSWORD=<your db user password>
- RAILS_MASTER_KEY=<your master key >

* Generate master key if now available using command
  - `/bin/rails credentials:edit`