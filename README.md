# Secret Website

[https://tibo-secret.herokuapp.com](https://tibo-secret.herokuapp.com)

Rails project to get to know the authentification process in Rails.

Our first approach of sessions and cookies aswell as access rights to certain pages.

Errors and successes are notified to the user through `flash` notifications.

We use PostgresQl as a database.


To install the project, run:
```sh
$ bundle install
```

To use locally you will need to setup a postgresQL database.
If you have postgresQL installed on your system, run:
```sh
$ createdb secret 
$ createuser secret_development --createdb
```

Finally start the migrations and seed the database
```sh
$ rails db:migrate && rails db:seed
```