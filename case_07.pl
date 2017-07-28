#!C:\xampp\perl\bin\perl -w
#/usr/bin/perl -w

@mass = qw(one two six nine two one);
for (my $i = 0; $i < @mass; $i++) {
	$mass2{$mass[$i]}++;
}

while (($key, $value) = each(%mass2)) {
	print "$key => $value\n";
}

print "Ascending sort:\n";
foreach (sort { $mass2{$a} <=> $mass2{$b} } keys(%mass2)) {
	print "$_ => $mass2{$_}\n";
}

print "Descending sort:\n";
foreach (sort { $mass2{$b} <=> $mass2{$a} } keys(%mass2)) {
	print "$_ => $mass2{$_}\n";
}