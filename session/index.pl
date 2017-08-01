#!C:\xampp\perl\bin\perl
#/usr/bin/perl
use strict;
use warnings;

use CGI::Carp qw(fatalsToBrowser);
use CGI qw( :standard );
use CGI::Session;
use Digest::MD5 qw( md5_hex );
push(@INC, 'C:/Users/Alex/Documents/perl/Perl/session');
require "MyData.pm";
my $log = $MyData::enter_login;
my $pass = $MyData::enter_passw;

my $err = "";
my $formLogin = param("login");
my $formPass = param('passw');

if(defined($formLogin) && defined($formPass)) {
	$formPass = md5_hex($formPass);
	if($formLogin eq $log && $formPass eq $pass) {
		my $tmp = $MyData::SessPath;
		#$CGI::Session::MySQL::TABLE_NAME = $MyData::TableName;
		#my $sess = CGI::Session->new("driver:mysql", undef, {DataSource=>$MyData::DataSource, User=>$MyData::User, Password=>$MyData::Password}) or die CGI::Session->errstr();
		my $sess = CGI::Session->new("driver:file", undef, {Directory=>$tmp}) or die CGI::Session->errstr();
		$sess->name('SID');
		my $cookies = cookie(-name=>$sess->name(), -value=>$sess->id, -path=>'/', -domain=>'localhost');
		print "Set-Cookie: $cookies\n";
		$sess->param(-name=>'Login', -value=>$formLogin);
		$sess->param(-name=>'Password', -value=>$formPass);
		$sess->expire($MyData::SessTime);
		$sess->flush();
		print "Location: secure.pl?SID=" . $sess->id() . "\n\n";
		exit();
	} else {
		$err = "Incorrect login or password!\n";
	}
}
print "Content-type: text/html\n\n";
print <<HTML_CODE;
<html>
<head></head>
<body>
</body>
</html>
HTML_CODE

