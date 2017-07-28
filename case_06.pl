#!C:\xampp\perl\bin\perl -w
#/usr/bin/perl -w

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

chomp(@mass2); ## chop()
@mass3 = grep($_ <= 50, @mass2);
@mass3 = map($_ * 3, @mass2);

%mass4 = ("Jan" => 1, "Feb" => 2, "Mar" => 3);
while(($key, $value) = each(%mass4)) {
	print "$key => $value";
}

foreach my $var (keys(%mass4)) {
	print "$var => $mass4{$var}\n";
}

@mass4_ = keys(%mass4);
while ($var = pop(@mass4_)) {
	print "$var => $mass4{$var}\n";
}

if(exists($mass4{'Jan'})) {
	print "\$mass4{'Jan'} exists";
}

sub f_sort {
	$str1 = lc($_[0]);
	$str2 = lc($_[1]);
	if($str1 gt $str2) { return 1; }
	if($str1 lt $str2) { return -1; }
	return 0;
}