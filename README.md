# AW-test-api


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

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

*Configuration
RAILS_ENV=<environment name>
POSTGRES_HOST=<pg host name>
POSTGRES_DB=<your databse name password>
POSTGRES_USER=<your db user>
POSTGRES_PASSWORD=<your db user password>
RAILS_MASTER_KEY=<your master key >