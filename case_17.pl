#!C:\xampp\perl\bin\perl
#/usr/bin/perl
use strict;
use warnings;

use HTML::TokeParser;
use HTML::Entities;

my $text = "<HTML></HTML>";

my $parser = HTML::TokeParser->new(\$text);
while (my $item = $parser->get_token()) {
#--------------begin tag--------------
	if($item->[0] eq 'S') {
		print $item->[1], "\n";
		print encode_entities($item->[4], '<>"&'), "\n";
		my @attr = @{$item->[3]};
		for (my $i = 0; $i < @attr; $i++) {
			print $attr[$i], " -> ", $item->[2]{$attr[$i]}, "\n";
		}
	}
#--------------end tag--------------
	if ($item->[0] eq 'E') {
		print $item->[1], "\n";
		print encode_entities($item->[2], '<>"&'), "\n";
	}
#--------------text--------------
	if ($item->[0] eq 'T') {
		if ($item->[1] ne '' && $item->[1] ne '\n') {
			print $item->[1], "\n";
		}
	}
#--------------comment--------------
	if ($item->[0] eq 'C') {
		print encode_entities($item->[1], '<>"&'), "\n";
	}
}

my @tags = ("a", "img", "title");
while (my $item = $parser->get_tag(@tags)) {
	if ($item->[0] eq 'title') {
		print "title: " . $parser->get_trimmed_text("/title") . "\n";
	}
	if ($item->[0] eq 'a') {
		print "a: " . encode_entities($item->[3], '<>"&') . "\n";
		my @attr = @{$item->[2]};
		for (my $i = 0; $i < @attr; $i++) {
			print $attr[$i], " -> ", $item->[1]{$attr[$i]} . "\n";
		}
		print $parser->get_trimmed_text("/a");
	}
	if ($item->[0] eq 'img') {
		print "img: " . encode_entities($item->[3], '<>"&') . "\n";
		my @attr = @{$item->[2]};
		for (my $i = 0; $i < @attr; $i++) {
			print $attr[$i], " -> ", $item->[1]{$attr[$i]} . "\n";
		}
	}
}