#!C:\xampp\perl\bin\perl
#/usr/bin/perl
use strict;
use warnings;

use CGI::Carp qw(fatalsToBrowser);
use CGI::Session;
print "Content-type: text/html\n\n";

my $tmp = "./";
CGI::Session->find("driver:file", \$f_delete, {Directory=>$tmp});
sub f_delete {
	my ($session) = @_;
	next if($session->is_empty());
	if(($session->ctime() + 86400) < time()) {
		$session->delete();
	}
}