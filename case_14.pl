#!C:\xampp\perl\bin\perl
#/usr/bin/perl
use strict;
use warnings;

use LWP::Simple qw(:DEFAULT $ua);
$ua->agent("MySpider/1.0");
#my $doc = get("http://wwwadmin.ru/");


my @doc = head("http://wwwadmin.ru/");
#if(defined($doc)) {
if(@doc) {
	#print $doc;
	for (my $i = 0; $i < @doc; $i++) {
		my $str = $doc[$i] || "";
		print "$i -> ", $str, "\n";
	}
}

#my $status = getprint("http://wwwadmin.ru/");
#print "code: " . $status;
#my $status = getstore("http://wwwadmin.ru/", "file.txt");
#print $status;

use LWP::UserAgent;
my $robot = LWP::UserAgent->new();
$robot->max_size(120);
$robot->timeout(180);
$robot->parse_head(1);
$robot->max_redirect(7);
$robot->agent("MySpider/1.0");

#my $request = HTTP::Request->new(GET => 'http://wwwadmin.ru/');
my $request = HTTP::Request->new();
$request->method('GET');
$request->uri("http://wwwadmin.ru/");
$request->header('User-Agent' => 'MySpider/1.0', "Accept" => 'text/html, text/plain');
$request->push_header('Accept' => ', image/*');
$request->remove_header('Accept');

#$request->content_type('application/x--www-form-urlencoded');
#$request->content('i_author=Test&i_msg=Test&i_go=go');

print $request->as_string();
print $request->header('Accept');

my $result = $robot->request($request);
#my $result = $robot->simple_request($request);
if($result->is_success()) {
	print $result->status_line(), "\n";
	print $result->code(), " - ", $result->message(), "\n";
	print $result->protocol(), "\n";
	print $result->base(), "\n";
	#print $result->as_string(), "\n";
	#print $result->content(), "\n";
	print $result->headers_as_string(), "\n";
	#print $result->header('Title'), "\n";
	if($result->content_type eq 'text/html') {
		print "html - document", "\n";
	}
}
if($result->is_error()) {
	print $result->error_as_HTML();
}