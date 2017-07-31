#!C:\xampp\perl\bin\perl
#/usr/bin/perl
use strict;
use warnings;

my $header = "From: <support\@site.ru>\n";
$header .= "To: Test <test\@mail.ru>\n";
$header .= "Subject: Test mail\n";
$header .= "Content-Type: text/html; charset=windows-1251\n";
$header .= "Content-Transfer-Encoding: 8bit\n\n";

my $msg = "";

open(MAIL, "| /usr/bin/sendmail -t") or die("ERROR > $!");
print MAIL $header;
print MAIL $msg;
close(MAIL) or die("ERROR > $!");