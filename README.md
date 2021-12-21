# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  3.0.x

* System dependencies

* Configuration

* Database creation
  - When creating related fields, don't use t.belongs_to. Use t.uuid as belongs_to defaults to bigint and we use UUID

* Database initialization
  - rails db:setup should cover everything. There are some seeds.
  - Seeds are split into db/seeds/*.rb to make it easier to go through.

* How to run the test suite
  - docker-compose run web rails test
  - Rubocop: docker-compose exec web rubocop

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* Docker commands
  - Start: docker-compose up --build
  - "FATAL:  the database system is starting up (PG::ConnectionBad)" - comment out all of `web` in docker-compose.yml. Bring up just db, then bring it down, then bring up web and db together.

Messing with JWT:
curl -XPOST -i -H "Content-Type: application/json" -d '{ "user": { "email": "chris@peerpride.com", "password": "PASSWORD" }}' http://0.0.0.0:3000/api/login
