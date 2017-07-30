#!C:\xampp\perl\bin\perl -w
#/usr/bin/perl -w

use strict;

#my @mass_ref = (\@mass, \@mass2);
my @mass_ref = ([], []);

foreach my $row (@mass_ref) {
	foreach my $item (@$row) {
		print "$item\n";
	}
}

$mass_ref[2] = ['1', '2'];
my @m = ("One", "Two");
@{$mass_ref[3]} = @m;

for (my $i = 0; $i < @mass_ref; $i++) {
	for (my $j = 0; $j < @{$mass_ref[$i]}; $j++) {
		print "\n> $mass_ref[$i][$j]\n";
	}
}

my $link = [[], []];
foreach my $row (@$link) {
	foreach my $item (@$row) {
		print "$item ";
	}
	print "\n";
}

$link->[2] = [];
my @mass = ("", "");
$link->[3] = [@mass];

for (my $i = 0; $i < @$link; $i++) {
	for (my $j = 0; $j < @{$link->[$i]}; $j++) {
		print $link->[$i][$j], " ";
	}
	print "\n";
}

my %tag = (
	"p" => {},
	"img" => {}
);

#$tag{"img"}{"src"};
#$tag{"img"}->{"src"};
#${$tag{"img"}}{"src"};
$tag{"a"} = {};

foreach my $var1 (sort(keys(%tag))) {
	print "$var1: ";
	foreach my $var2 (sort(keys(%{$tag{"$var1"}}))) {
		print "$var2 -> $tag{$var1}{$var2}";
	}
	print "\n";
}

my @car = ({"m" => "m"}, {"g" => "g"});
#$car[0]{""};
#$car[0]->{""};
#${$car[0]}{""};

foreach my $var (@car) {
	foreach my $key (sort(keys(%$var))) {
		print "<> $key => $var->{$key}";
	}
	print "\n";
}

push(@car, {"c" => "c"});

for (my $i = 0; $i < @car; $i++) {
	print "[$i]";
	foreach my $key (sort(keys(%{$car[$i]}))) {
		print "= $key => $car[$i]{$key}";
	}
	print "\n";
}

my %word = ("a" => [], "b" => []);
#$word{"a"}[2];
#$word{"a"}->[2];
#${$word{"a"}}[2];

$word{"c"} = [];

foreach my $key (sort(keys(%word))) {
	print "$key => ";
	for (my $i = 0; $i < @{$word{$key}}; $i++) {
		print "$word{$key}[$i]\n";
	}
}

my %switch = ("a" => \&f_sub1, "b" => \&f_sub2);
my $str = "a";
if($str eq "") {
	exit 1;
} elsif(exists($switch{$str})) {
	$switch{$str}->();
} else {
	print "not found\n";
}

sub f_sub1 {
	print "f_sub1\n";
	return 0;
}

sub f_sub2 {
	print "f_sub2\n";
	return 0;
}

#if(ref($tag[$i] eq 'HASH')) {}

#my $var1 = *var{SCALAR}; //ARRAY, HASH, CODE
our $str1 = "11";
my $link1 = \*str1;
print ref($link1); ##GLOB
print "\n".$$$link1;

our $PI = 3.14;
my $pi = *PI{SCALAR};
print "\n".$$pi;

#no strict "subs";
*p = \3.14;
print "\n".${*p};

print "\nPackage name: " . __PACKAGE__ . "\n";
print &main::f_sub1."\n";

unshift(@INC, "..");
for (my $i = 0; $i < @INC; $i++) {
	print $INC[$i]."\n";
}