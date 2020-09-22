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
      _os => shift || 'NULL',
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
  my $checksum = "'abcd'";
  my $name = "'".$self->{_name}."'";
  my $os = "'".$self->{_os}."'";
  my $stmt = qq(INSERT INTO $vmTable (NAME,OS,STORAGE,CHECKSUM,CREATE_TIME,LAST_UPDATE) VALUES ($name,$os, $self->{_storage},$checksum,$createTime,$lastUpdate); 
        );
  # print "Debug: stmt is: $stmt";
  my $rv = $dbh->do($stmt) or error($DBI::errstr); 
  if ($rv){ 
     print "Successfully created vm $self->{_name}\n";
  }
  else {
     print "Faile to create vm $self->{_name}\n";
  }
}

sub read {
  my $self = shift;
  my $name = "'".$self->{_name}."'";
  my $stmt = qq(SELECT * from $vmTable where name = $name; );
  my $sth = $dbh->prepare($stmt);
  $sth->execute();

  while ( my @row = $sth->fetchrow_array() ) {
    print join(' ', @row)."\n";
  }
  $sth->finish();
}

# update(name,os,storage);
sub update {
  my $self = shift;
  my $name = shift || $self->{_name};
  my $name = "'".$name."'";
  my $os = shift || $self->{_os};
  my $os = "'".$os."'";
  my $storage = shift || $self->{_storage};
  my $lastUpdate = "'2020-10-22 20:10:25'";
  my $pre_name = "'".$self->{_name}."'";
  my $updateStr = "NAME=$name, OS=$os,STORAGE=$storage,LAST_UPDATE=$lastUpdate";
  my $stmt = qq(UPDATE $vmTable set $updateStr where name=$pre_name;);
  print "update string: $stmt \n";
  my $rv = $dbh->do($stmt) or error($DBI::errstr);
  
  if ($rv){
    print "Successfully updated vm $self->{_name}\n";
    # TODO reset obj properties 
 }
  else {
    print "Faile to update vm $self->{_name}\n";
  }
  
}

sub delete {
 my $self = shift;
 my $name = "'".$self->{_name}."'";
 my $stmt = qq(DELETE FROM $vmTable where name=$name;);
 my $rv = $dbh->do($stmt) or error($DBI::errstr); 
 if ($rv){
   print "Successfully deleted vm $self->{_name}\n";
 }
 else {
   print "Faile to delete vm $self->{_name}\n";
 }
}


sub error {
  my $errMsg = shift;
  print $errMsg."\n";
  # exit 0;
}

sub closeDB{
 $dbh->disconnect();
 print "Database closed. \n";
}

1;

