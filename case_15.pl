#!C:\xampp\perl\bin\perl
#/usr/bin/perl
use strict;
use warnings;

use LWP::RobotUA;
my $email = "test\@test.ru";
my $robot = LWP::RobotUA->new("MySpider/1.0", $email);
$robot->delay(10 / 60);
$robot->use_sleep(1);

my $request = HTTP::Request->new();
$request->method('GET');
$request->uri("http://wwwadmin.ru/");
$request->header('User-Agent' => 'MySpider/1.0', "Accept" => 'text/html, text/plain');

my $result = $robot->request($request);
print $result->status_line, "\n";
print $result->headers_as_string(), "\n";
