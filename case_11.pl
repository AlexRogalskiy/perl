#!C:\xampp\perl\bin\perl -w
#/usr/bin/perl -w
use strict;

use lib "C:\\Users\\Alex\\Documents\\perl\\Perl";
use MyClass 1.0;

my $obj = MyClass->new("var" => 20); #MyClass::new("MyClass", "var" => 20);
print $obj, "\n";
print ref($obj), "\n";

print $MyClass::public_str, "\n";
#print $MyClass::str, "\n";

print $obj->f_get(), "\n";
$obj->f_display();

$obj->f_set("New private string");
$obj->{"var"} = 8;

print $obj->f_display();
$obj->f_printt();