#  FRIENDS FIND API

## Setup
* git clone `github.com/EvanBrightside/friends_find_api.git`
* bundle install
* cp config/database.yml.example config/database.yml
* rails db:setup
* rails db:migrate
* rails db:seed
* rails s

## Tech
* Ruby on Rails 5.2.2
* Ruby 2.6.0

## Local usage
* swagger: `localhost:3000/api-docs/index.html`

## Heroku usage
* swagger: `https://friends-find-api.herokuapp.com/api-docs/index.html`

## Example
* api :GET, `http://localhost:3000/api/users/:id`
* api :POST, `http://localhost:3000/api/users/search?radius=5&&lat=55.75&&lng=37.6167`
