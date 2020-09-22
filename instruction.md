# db operation
~~~
sudo -i -u postgress
~~~

# package install
* install perl DBI: 
* install perl DBD: 
~~~
sudo apt-get install libpq-dev
sudo apt install libdbd-pg-perl
~~~


# Create user
~~~
psql
# create user jeannie/123456
CREATE USER jeannie WITH PASSWORD '123456';
CREATE DATABASE vm;

~~~

# installs:
1. install DBI:


# change settings on hba file
* ask where hba_file is
~~~
psql
SHOW hba_file;
# output depends on the installation:
# mine is  
# /etc/postgresql/12/main/pg_hba.conf
# I was suppose to add the following line to pg_hba.conf, but when I open it
# it is already there
host    all         all         127.0.0.1/32          md5
~~~

# install self defined perl module
~~~
h2xs -AX -n ModuleName
# then put all *.pm files under ModuleName/lib/*

# then run following command under ModuleName folder:
cd ModuleName
perl Makefile.PL
make
sudo make install

~~~
