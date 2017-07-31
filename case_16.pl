#!C:\xampp\perl\bin\perl
#/usr/bin/perl
use strict;
use warnings;

use URI;
my $path = "http://www.wwwadmin.ru:80/test.php?var=5#anchor";
my $url = URI->new($path);
print $url->as_string(), "\n";
print $url->scheme(), "\n";
print $url->opaque(), "\n";
print $url->authority(), "\n";
print $url->host(), "\n";
print $url->port(), "\n";
print $url->path(), "\n";
print $url->query(), "\n";
print $url->path_query(), "\n";
print $url->fragment(), "\n";

my $url_ = URI->new_abs('file.html', $path);
print $url_->as_string(), "\n";

local $URI::ABS_REMOTE_LEADING_DOTS = 1;
my $url__ = URI->new("file.html")->abs($path);
print $url__->as_string(), "\n";

use URI::Escape;
print uri_escape("Строка");
#print uri_unescape("");

use HTML::Entities;
my $str = encode_entities('<a href></a>', '<>"&');
#print decode_entities($str);

#use Text::Iconv;
#my $iconv1 = Text::Iconv->new("windows-1251", "koi8-r");
#print $iconv1->convert("");

use HTML::LinkExtor;
my $parser = HTML::LinkExtor->new(\&f_parser, $path);
$parser->parse("");
$parser->parse_file("");

our(@link, @mailto, @imt, @frame, @map);
sub f_parser {
	my ($tag, %links) = @_;
	if($tag eq 'a') {
		if($links{'href'} =~ /^mailto:/i) {
			push(@mailto, $links{'href'})
		} else {
			push(@link, $links{"href"});
		}
	}
}