#!/usr/bin/perl

package VmManager::vmModule;

print "import VM module";

use DBI;
use strict;

my $driver = "Pg";
my $database = "vmmanager";

my $dsn = "DBI:$driver:dbname=$database;host=127.0.0.1;port=5432";
my $userid = "jeannie";
my $password = "123456";
my $dbh = DBI->connect($dsn, $userid, $password, {RaiseError=>1})
         or die $DBI::errstr;
my $vmTable = "vm";

print "Opened database successfully \n";

# create vm object
# properties: name,os,[storage]
sub new {
  my $class = shift;
  my $self = {
      _name => shift,
      _os => shift,
      _storage => shift || 'NULL'
  };
  bless ($self, $class);
  return $self;
}

sub create {
  # TODO: create time, checksum,update time,
  my $self = shift;
  my $createTime = "'2020-09-22 20:10:25'";	
  my $lastUpdate = $createTime;
  my $checksum = "abcd";
  my $name = "'".$self->{_name}."'";
  my $os = "'".$self->{_os}."'";
  my $stmt = qq(INSERT INTO $vmTable (NAME,OS,STORAGE,CREATE_TIME,LAST_UPDATE) VALUES ($name,$os, $self->{_storage},$createTime,$lastUpdate); 
        );
  # print "Debug: stmt is: $stmt";
  my $rv = $dbh->do($stmt) or error($DBI::errstr); 
  print "Successfully created vm $self->{_name}\n";
}

sub error {
  my $errMsg = shift;
  print $errMsg;
  exit 0;
}

sub closeDB{
 $dbh->disconnect();
 print "Database closed. \n";
}

1;

