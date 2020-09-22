#!/usr/bin/perl

use DBI;
use strict;

my $driver = "Pg";
my $database = "vmmanager";

my $dsn = "DBI:$driver:dbname=$database;host=127.0.0.1;port=5432";
my $userid = "jeannie";
my $password = "123456";
my $dbh = DBI->connect($dsn, $userid, $password, {RaiseError=>1}) 
	 or die $DBI::errstr;

print "Opened database successfully \n";
my $osType = qq(
        CREATE TYPE OSTYPE as enum
        ('ubuntu','centos','windows');
);
my $stTableStmt = qq(CREATE TABLE IF NOT EXISTS STORAGE
    (ID SERIAL PRIMARY KEY NOT NULL,
     NAME TEXT NOT NULL UNIQUE,
     CAPACITY TEXT NOT NULL,
     LAST_UPDATE TIMESTAMP,
     CREATE_TIME TIMESTAMP
    );
);


my $vmTableStmt = qq(CREATE TABLE IF NOT EXISTS VM
    (ID SERIAL PRIMARY KEY NOT NULL,
     NAME   TEXT        NOT NULL UNIQUE,
     OS     OSTYPE      NOT NULL,
     STORAGE INTEGER REFERENCES STORAGE,
     CHECKSUM   CHAR(50),
     LAST_UPDATE TIMESTAMP,
     CREATE_TIME TIMESTAMP
    );
); 

my $rv = $dbh->do($osType) or warn $DBI::errstr;
print "Successfully create os enum ostype \n";

$rv = $dbh->do($stTableStmt) or warn $DBI::errstr;
print "Successfully create storage table \n";

$rv = $dbh->do($vmTableStmt) or warn $DBI::errstr;

print "Successfully create vm table \n";

$dbh->disconnect();
print "Closed database successfully\n";
