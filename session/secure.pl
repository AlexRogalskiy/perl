#!C:\xampp\perl\bin\perl
#/usr/bin/perl
use strict;
use warnings;

use CGI::Carp qw(fatalsToBrowser);
use CGI qw( :standard );
use CGI::Session;
require "MyData.pm";

my $SID;
my $method;
if(defined(cookie('SID'))) {
	$SID = cookie('SID');
	$method = 'cookies';
} elsif(defined(param('SID'))) {
	$SID = param('SID');
	$method = 'path';
} else {
	print "Location: index.pl\n\n";
	exit();
}

my $tmp = "./";
#$CGI::Session::MySQL::TABLE_NAME = $MyData::TableName;
#my $sess = CGI::Session->new("driver:mysql", $SID, {DataSource=>$MyData::DataSource, User=>$MyData::User, Password=>$MyData::Password}) or die CGI::Session->errstr();
my $sess = CGI::Session->new("driver:file", $SID, {Directory=>$tmp}) or die CGI::Session->errstr();
$sess->name('SID');
if($sess->is_empty()) {
	&f_delete_session();
	print "Location: index.pl\n\n";
	exit();
}
if($sess->is_expired()) {
	&f_delete_session();
	print "Location: index.pl\n\n";
	exit();
}
if($sess->remote_addr() ne $ENV{'REMOTE_ADDR'}) {
	&f_delete_session();
	print "Location: index.pl\n\n";
	exit();
}

require "MyData.pl";
my $log = $MyData::enter_login;
my $pass = $MyData::enter_passw;

my $err = "";
my $formLogin = param("login");
my $formPass = param('passw');

if(defined($formLogin) && defined($formPass)) {
	unless($formLogin eq $log && $formPass eq $pass) {
		&f_delete_session();
		print "Location: index.pl\n\n";
		exit();
	}
} else {
	&f_delete_session();
	print "Location: index.pl\n\n";
	exit();
}
print "Content-type: text/html\n\n";
print <<HTML_CODE;
<html>
<head></head>
<body>
f_add_sid('exit.pl');
if($method eq 'path') {
	<input type="hidden" name="$sess->name()" value="$SID"/>
}
</body>
</html>
HTML_CODE

$sess->atime(time());
$sess->flush();

sub f_delete_session {
	my $cookies = cookie(-name=>$sess->name(), -value=>'', -expires=>'-1d', -path=>'/', -domain=>'localhost');
	print "Set-Cookie: $cookies\n";
	$sess->delete();
	$sess->flush();
}

sub f_add_sid {
	my $url = shift();
	if($method eq 'path') {
		if(defined($SID) && $url !~ m/SID=/) {
			if ($url !~ m/\?/) {
				$url .= "?SID=" . $SID;
			} else {
				$url .= "&SID" . $SID;
			}
		}
	}
	return $url;
}
