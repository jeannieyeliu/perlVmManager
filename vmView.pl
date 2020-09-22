#!/usr/bin/perl

use strict;
use warnings;

my $usage = 'Usage: vmView.pl <command> [<args>]
    createVM <vm> [<vm2>...]           Create a VM with a name, can create multiple VMs
    readVM   [<vm> <vm2>...]           Show the information of a vm
    updateVM <vm> -n <name>            update VM 
    deleteVM <vm> [<vm2>...]           Detele a VM (will unlink the storage)
    lsVM                               List all VM
    linkST   <vm> <storage>            Link VM with a storage
    unlinkST <vm> [<storage>]          Unlink the storage binding to vm.
                                       if storage is not given then unlink 
			               all the storages


    createST <st> <size >[<st2> <size2>...] 
                                       Create a VM with a name

    readST   <st> [<st2>...]           Show the information of a VM
    updateST <st> [-n <name>] [-s size]
                                       Bind VM with a storage
    deleteST <st> [<st2...]            Detele a VM (will unlink the storage)
    listST                             List all VMs and its binding storage
    unlinkVM <storage>                 Unlink the storage binding to vm'."\n";

unless (exists($ARGV[0])){
   print $usage;
   exit 0;
}

my $cmd = shift @ARGV;


# ====================== handle commands ===================

if (lc($cmd) eq 'createvm'){
    if (@ARGV == 0) {
        print "usage: vmView.pl createVM <vm> [<vm2>...] \n\n";
    } else {
        foreach my $vm (@ARGV) {
            createVM($vm);
        }
    }
}

if (lc($cmd) eq 'readvm'){
    if (@ARGV == 0) {
        print "usage: vmView.pl readVM [<vm> <vm2>...]\n\n";
    } else {
        foreach my $vm (@ARGV) {
            readVM($vm);
        }
    }
}


if (lc($cmd) eq 'updatevm'){
    if (@ARGV == 0) {
        print "usage: vmView.pl updateVM <vm> -n <name> \n\n";
    } else {
        foreach my $vm (@ARGV) {
            updateVM($vm);
        }
    }
}

if (lc($cmd) eq 'deletevm'){
    if (@ARGV == 0) {
        print "usage: vmView.pl deleteVM <vm> [<vm2>...] \n\n";
    } else {
        foreach my $vm (@ARGV) {
            deleteVM($vm);
        }
    }
}

if (lc($cmd) eq 'lsvm'){
    lsVM();
}

if (lc($cmd) eq 'linkst'){
    if (@ARGV < 2) {
        print "usage: vmView.pl linkST <vm> <storage> \n\n";
    } else {
        foreach my $vm (@ARGV) {
            linkST($vm);
        }
    }
}

if (lc($cmd) eq 'unlinkst'){
    if (@ARGV == 0) {
        print "usage: vmView.pl unlinkST <vm> [<storage>] \n\n";
    } else {
        foreach my $vm (@ARGV) {
            unlinkST($vm);
        }
    }
}

if (lc($cmd) eq 'createst'){
    if (@ARGV == 0) {
        print "usage: vmView.pl createST <st> <size >[<st2> <size2>...]\n\n";
    } else {
        foreach my $vm (@ARGV) {
            createST($vm);
        }
    }
}

if (lc($cmd) eq 'readst'){
    if (@ARGV == 0) {
        print "usage: vmView.pl readST   <st> [<st2>...]\n\n";
    } else {
        foreach my $vm (@ARGV) {
            readST($vm);
        }
    }
}

if (lc($cmd) eq 'updatest'){
    if (@ARGV == 0) {
        print "usage: vmView.pl <st> [-n <name>] [-s size]\n\n";
    } else {
        foreach my $vm (@ARGV) {
            updateST($vm);
        }
    }
}

if (lc($cmd) eq 'deletest'){
    if (@ARGV == 0) {
        print "usage: vmView.pl deleteST <st> [<st2...] \n\n";
    } else {
        foreach my $vm (@ARGV) {
            deleteST($vm);
        }
    }
}

if (lc($cmd) eq 'listst'){
    listST();
}

if (lc($cmd) eq 'unlinkvm'){
    if (@ARGV == 0) {
        print "usage: vmView.pl unlinkVM <st> [<st2>...]   \n\n";
    } else {
        foreach my $vm (@ARGV) {
            unlinkVM($vm);
        }
    }
}



# ===================== handle operations =================
sub createVM {
    my $vm = $_[0];
    print "successfully create virtual machine $vm \n";
}


sub readVM { 
    my $vm = $_[0];
    # TODO read Vm
    print "TODO reading virtual machine $vm\n"; 
}

sub updateVM {
    my $vm = $_[0];    
    print "TODO updateVM\n";
}

sub deleteVM {
    my $vm = $_[0];    
    print "TODO deleteVM\n";
}

sub lsVM {
    print "TODO lsVM \n";
}

sub linkST {
    print "TODO linkST\n";
}

sub unlinkST {
    my $vm = $_;    
    print "TODO unlinkST\n";
}

sub createST {
    my $vm = $_;    
    print "TODO createST\n";
}

sub readST {
    my $vm = $_;    
    print "TODO readST\n";
}

sub updateST {
    my $vm = $_;    
    print "TODO updateST\n";
}


sub deleteST {
    my $vm = $_;    
    print "TODO deleteST\n";
}



sub listST {
    my $vm = $_;    
    print "TODO listST\n";
}



sub unlinkVM {
    my $vm = $_;    
    print "TODO unlinkVM\n";
}



