# LicenceHub

## Database
We are using *Postgres* as our `Database` and execute the fallowing command to create the `Database`
```
bin/rails db:setup
bin/rails db:migrate
```
This will create a `development` database and for `test` execute
```
RAILS_ENV=test bin/rails db:setup
RAILS_ENV=test bin/rails db:migrate
```
## Tests
We are using [rspec](http://rspec.info/documentation/) to run our tests.
Execute `bundle exec rspec` to run all tests and `bundle exec rspec #file`to run a specific test.

## Deploy
There is no deploy yet

## Documentation
To now more aboult the project's structure read the documentation, and to create these execute
`bundle exec yard doc`
More about `yard` look at [here](http://yardoc.org/)
