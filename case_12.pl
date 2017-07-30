#!C:\xampp\perl\bin\perl
#/usr/bin/perl
use strict;
use warnings;
use CGI::Carp qw(fatalsToBrowser);
print "Content-type: text/html\n\n";

#print $ENV{'DOCUMENT_ROOT'};
foreach my $var (keys(%ENV)) {
	print "$var => $ENV{$var}\n";
}
