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
my $vmTableStmt = qq(DROP TABLE IF EXISTS VM;);
my $stTableStmt = qq(DROP TABLE IF EXISTS STORAGE;);
my $osTypeStmt = qq(DROP TYPE IF EXISTS OSTYPE;);

my $rv = $dbh->do($vmTableStmt) or warn $DBI::errstr;
print "Successfully delete vm table \n";

$rv = $dbh->do($stTableStmt) or warn $DBI::errstr;
print "Successfully delete storage table \n";

$rv = $dbh->do($osTypeStmt) or warn $DBI::errstr;
print "Successfully delete ostype \n";


$dbh->disconnect();
print "Closed database successfully\n";

