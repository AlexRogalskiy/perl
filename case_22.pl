#!C:\xampp\perl\bin\perl
#/usr/bin/perl
use strict;
use warnings;

use DBI;

my @drivers = DBI->available_drivers();
print join("\n", @drivers);
