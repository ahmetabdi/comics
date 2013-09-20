comics
======

$ sudo apt-get install postgresql

$ sudo apt-get install libpq-dev

gem 'pg'

$ sudo su postgres -c psql

postgres=# CREATE ROLE <username> SUPERUSER LOGIN;

postgres=# \q

$ rake db:create:all

$ rake db:migrate
