#!C:\xampp\perl\bin\perl -w
#/usr/bin/perl -w

use CGI::Carp qw(fatalsToBrowser);
use locale;
use POSIX 'locale_h';

setlocale(LC_CTYPE, 'ru_RU.CP1251');

@mass = ("ыва", "ыфаыфав", "цкйу"); #qw(ыва ыфаыфав цкйу);
@mass = sort { f_sort($a, $b) } @mass;

for (my $i = 0; $i < @mass; $i++) {
	print "$mass[$i]\n";
}

foreach my $var (@mass) {
	print "$var\n";
}

@mass2 = (1 .. 10);

foreach (@mass2) {
	print "$_\n";
}

print join(" - ", @mass2);

sub f_sort {
	$str1 = lc($_[0]);
	$str2 = lc($_[1]);
	if($str1 gt $str2) { return 1; }
	if($str1 lt $str2) { return -1; }
	return 0;
}