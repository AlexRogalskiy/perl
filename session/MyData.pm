package MyData;

#!C:\xampp\perl\bin\perl
#/usr/bin/perl
use strict;
use warnings;
use Exporter;

our @ISA = qw( Exporter );
our @EXPORT = qw( %DATA );
our @EXPORT_OK = qw();
our $EXPORT_TAGS = ("user" => [qw()], "admin" => [qw()]);
Exporter::export_ok_tags('user', 'admin');

our $enter_login = "login";
our $enter_passw = "";

our $TableName = "Sessions";
our $DataSource = "dbi:mysql:SessionDB:localhost";
our $User = 'root';
our $Password = 'toor';

our $SessTime = "+15m";
our $SessPath = "./";

our %DATA;
$DATA{'HOST'} = "localhost";
$DATA{'LOGIN'} = "root";
$DATA{'PASSW'} = "toor";
$DATA{'DB'} = "SessionDB";

#use lib "";
#use MyData qw(:DEFAULT :user);
1;