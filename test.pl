#!/usr/bin/perl


use VmManager::storageModule;
use VmManager::vmModule;
# test create
$vmObj = VmManager::vmModule->new('vmTest5','ubuntu');
$vmObj2 = VmManager::vmModule->new('vmTest1','ubuntu');
$vmObj3 = VmManager::vmModule->new('vmTest2','centos');

$vmObj->delete();
$vmObj2->read();
$vmObj->create();
$vmObj3->update('vmTest2-updated');

$vmObj->closeDB();
