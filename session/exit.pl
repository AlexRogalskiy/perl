#!C:\xampp\perl\bin\perl
#/usr/bin/perl
use strict;
use warnings;

use CGI::Carp qw(fatalsToBrowser);
use CGI qw( :standard );
use CGI::Session;
require "MyData.pm";

my $SID;
if(defined(cookie('SID'))) {
	$SID = cookie('SID');
} elsif(defined(param("SID"))) {
	$SID = param('SID');
} else {
	print "Location: index.pl\n\n";
	exit();
}

my $tmp = "./";
#$CGI::Session::MySQL::TABLE_NAME = $MyData::TableName;
#my $sess = CGI::Session->new("driver:mysql", $SID, {DataSource=>$MyData::DataSource, User=>$MyData::User, Password=>$MyData::Password}) or die CGI::Session->errstr();
my $sess = CGI::Session->new("driver:file", $SID, {Directory=>$tmp}) or die CGI::Session->errstr();
$sess->name('SID');
my $cookies = cookie(-name=>$sess->name(), -value=>'', -expires=>'-1d', -path=>'/', -domain=>'localhost');
print "Set-Cookie: $cookies\n";
$sess->delete();
$sess->flush();
print "Location: index.pl\n\n";
exit();