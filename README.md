# Realtime Search box

> The objective of this project is to develop a sophisticated web application centered around a curated collection of articles. The primary focus lies in implementing a robust search functionality that not only allows users to discover articles efficiently but also facilitates the systematic recording and sanitization of search queries for subsequent analytical endeavors.

## Built With

- Ruby on Rails
- Tailwind
- Postgres
- Redis
- Hotwire

## Getting Started

### Prerequisites

- Ruby
- Postgres server
- Redis server

### Setup

Clone this repo and enter the directory.

```sh
git@github.com:omar25ahmed/realtime-search-box && cd realtime-search-box
```

### Install

Run the following command to install all the dependencies.

```sh
bundle install
```

### Usage

Run the following command to start the server, then go to http://localhost:3000

```sh
rails db:create # create database
rails db:migrate # migrate tables
rails db:seed # load all data in database from seed.rb

bin/dev # necessary to start the app for the first time
---- or ----
rails s # can be used after starting the app at least once
```

## Author

👤 **Omar Ragheb**

- GitHub: [https://github.com/omar25ahmed](https://github.com/omar25ahmed)
- LinkedIn: [https://www.linkedin.com/in/omar-ragheb/](https://www.linkedin.com/in/omar-ragheb/)
- Twitter: [https://twitter.com/Omar25Ahmed](https://twitter.com/Omar25Ahmed)

## Show your support

Give a ⭐️ if you like this project!
