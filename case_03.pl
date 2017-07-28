#!C:\xampp\perl\bin\perl -w
#/usr/bin/perl -w

use CGI qw( :standard); #$s = new CGI; $s->param("name");
my $page = param("page");

if(defined($page)) {
	if($page == 1) {
		print "Location: case_01.pl\n\n";
		exit;
	}
} else {
	print "Location: case_02.pl\n\n";
	exit;
}