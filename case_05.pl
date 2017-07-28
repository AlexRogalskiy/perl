#!C:\xampp\perl\bin\perl -w
#/usr/bin/perl -w

%var = ('jan' => 1, 'feb' => 2);

print "Current line: ", __LINE__, "\n";
print "Current file: ", __FILE__, "\n";

delete($var{'feb'});

if(exists($var{'jan'})) {
	print "\n\$var{'jan'} is defined\n";
}

undef $var;

# last index
@mass = ("Zero", "One", "Two", "Three", "Four");
print $#mass . "\n";

# count elements
print scalar(@mass) . "\n";

# Add element
$mass[$#mass+1] = "Five";
$mass[@mass] = "Six";

# insert first element
unshift(@mass, "Seven", "Eight");

# insert last element
push(@mass, "Nine");

# remove first element
shift(@mass)."\n"; # print

# remove last element
pop(@mass)."\n"; # print

for($i=0; $i<@mass; $i++) {
	print "$mass[$i]\n";
}

@mass2 = ("ca", "eb", "3c");
splice(@mass, 2, scalar(@mass2), @mass2);

for($i=0; $i<@mass; $i++) {
	print "$mass[$i]\n";
}

@mass = reverse(@mass);

__END__
__DATA__