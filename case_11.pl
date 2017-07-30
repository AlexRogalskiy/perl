#!C:\xampp\perl\bin\perl
#/usr/bin/perl
use strict;
use warnings;

use lib "C:\\Users\\Alex\\Documents\\perl\\Perl";
use MyClass 1.0;
use MyClass2 1.0;

# compile errors
BEGIN {
	use CGI::Carp qw (carpout);
	open(ERRLOG, ">>errlog.txt") or die("Error occurred while creating new output file\n$!\n");
	carpout(\*ERRLOG);
}

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

#--------------------------
print "\n\n";

my $obj2 = MyClass2->new();
$obj2->f_new_method();
$obj2->f_print();
$obj2->f_display();

print "\n\n";

if($obj2->isa("MyClass")) {
	print "is inherited\n";
}
if ($obj2->isa("HASH")) { #ARRAY
	print "Link to HASH\n";
}
if ($obj2->can("f_new_method")) {
	print "f_new_method is defined\n";
} else {
	print "f_new_method is not defined\n";
}
if ($obj2->can("f_new")) {
	print "f_new is defined\n";
} else {
	print "f_new is not defined\n";
}
