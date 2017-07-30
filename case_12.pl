#!C:\xampp\perl\bin\perl
#/usr/bin/perl
use strict;
use warnings;
#use CGI::Carp qw(fatalsToBrowser);
#use CGI qw(:standard);

#my $cookie = cookie(-name=>'id', -value=>'85', -expires=>"+10d", -path="/", -domain="test.ru");
#print "Set-Cookie: $cookie\n";
#print "Content-type: text/html\n\n";

#print $ENV{'DOCUMENT_ROOT'};
foreach my $var (keys(%ENV)) {
	print "$var => $ENV{$var}\n";
}

#split(/; /, $ENV{'HTTP_COOKIE'});
#split(/&/, $ENV{'QUERY_STRING'});
my @cookies = ('one=1', 'two=2');
my %cookies_;
my ($name, $value);
foreach (@cookies) {
	($name, $value) = split(/=/, $_);
	$value =~ tr/+/ /;
	$value =~ s/%(..)/pack("C", hex($1))/eg;
	$cookies_{$name} = $value;
}

print "Cookie: $cookies_{'one'}\n";
print "Cookie: $cookies_{'two'}\n";