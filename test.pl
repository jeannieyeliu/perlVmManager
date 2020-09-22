#!/usr/bin/perl


use VmManager::storageModule;
use VmManager::vmModule;
# test create
$vmObj = VmManager::vmModule->new('vmTest2','ubuntu');

$vmObj->create();
$vmObj->closeDB();
