# CODENAMES

## Purpose
WIP

## Installation

| Dependencies |          |
|--------------|:--------:|
| Ruby version |   2.3.0  |
| Gem manager  |  bundler |
| DB           | postgres |

For the installation, run:
```
gem install bundler
bundle install
rake db:create db:migrate db:seed
rake words:load
```

## Running

#### Start local server
`rails server`

#### Run test suite
`rspec`

## Troubleshootings

#### Installation under Linux
Run the following commands if necessary:
```
- sudo apt-get install nodejs
- sudo apt-get install libpq-dev
```

#### Postgres issue
Run the following commands if necessary:
```
- sudo apt-get install postgresql
- sudo -u postgres -i
  - psql
  - createuser User
  - ALTER USER User CREATEDB;
```
