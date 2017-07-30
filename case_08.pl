#!C:\xampp\perl\bin\perl -w
#/usr/bin/perl -w

$str = "String\n\n\n\n";
$/ = ""; #\t
$var = chomp($str);
print "Deleted chars: " . $var . "\n";

substr($str, 4, 2, "xxx");

$str =~ tr/a-z/A-Z/;
print $str;
#change symbols except en to ?
$str =~ tr/a-z /?/c;
#shorted string
$count = $str =~ tr/a-z /?/cs;
#number of chars
$count = $str =~ tr/c//;

use Digest::MD5 qw(md5 md5_hex md5_base64);
$pass = "password";
print md5($pass);

$dg = Digest::MD5->new;
$dg->add($pass);
print $dg->digest . " " . $dg->hexdigest . " " . $dg->b64digest . "\n";

$str = "<BR<TD><OL>";
$pattern = qr/<(\w+)/;
@mass = $str =~ m/$pattern/ig;
for (my $i = 0; $i < @mass; $i++) {
	print "$mass[$i] \n";
}

while ($str =~ m/$pattern/ig) {
	print "$1 in " . pos($str) . "\n";
}

$email = 'unicode@test.ru';
$pattern = qr/^([a-z0-9_\.\-]+)\@(([a-z0-9\-]+\.)+[a-z]{2,4})$/;
if ($email =~ m/$pattern/i) {
	print "Email: ", $1, " domain: ", $2, "\n";
}

$str = "<br><td>";
$str =~ s/<(\w+)><(\w+)>/<$2><$1>/i; #<\2><\1>
print $str, "\n";

$str = "potop komok slovo";
$str =~ s/([a-z])([a-z])[a-z]\2\1/pal/ig;
print $str, "\n";

@mass = split("[\@\.]", $email);
for (my $i = 0; $i < @mass; $i++) {
	print "$mass[$i]", "\n";
}

foreach (@mass) {
	print "= $_\n";
}

foreach (1..10) {
	print "$_\n";
}

for (my $i = 0; $i < 10; $i++) {
	next if($i>4 && $i<11);
	print "$i\n";
}

for (my $i = 0; $i < 10; $i++) {
	last if($i>5);
	print "*$i\n";
}

$i=1;
while ($i<10) {
	if ($i<15) {
		print "$i\n";
		$i++;
		redo;
	}
}

$i=1;
BLOCK: {
	last BLOCK if($i>15);
	print "$i\n";
	$i++;
	redo BLOCK;
}

sub f_sum() {
	($x, $y) = @_;
	$x = 1 unless (defined($x));
	$y = 2 unless (defined($y));
	return $x + $y;
}
#$var = f_sum(4, 7);

sub f_factorial {
	my $x = shift();
	if ($x == 0 || $x == 1) {
		return 1;
	} else {
		return $x * f_factorial($x - 1);
	}
}

#/^[0-9]+$/
#qr/<(.+)>(.*)<\/\1>/;
#qr/<s1>(.*?)<\/s1>/;

#print $@ if(defined($a));

#@_
sub f_pass_gen {
	$count_char = shift();
	$count_char = 8 if(!defined($count_char));
	@mass = ('a', 'b', 'c', 'd', 'e');
	$passw = "";
	for (my $i = 0; $i < $count_char; $i++) {
		$passw .= $mass[int(rand(scalar(@mass)))];
	}
	return $passw;
}

print f_pass_gen(4);

@mass = gmtime(time());
@mass = localtime(time());

use POSIX;
use locale;
setlocale(LC_ALL, 'ru_RU.CP1251');

print strftime("\nToday %A %d.%m.%Y %H:%M:%S", localtime());


sub f_function {
	my $mass_link = shift();
	foreach my $var (@$mass_link) {
		$var += 5;
	}
}
@mass = (1..10);
f_function(\@mass);
foreach my $var (@mass) {
	print "\n--> $var\n";
}

sub f_function2 {
	my $hash_link = shift();
	foreach my $var (keys(%$hash_link)) {
		$$hash_link{$var} += 5;
	}
}
%hash = ("One" => 1, "Two" => 2, "Three" => 3);
f_function2(\%hash);
while (($key, $value) = each(%hash)) {
	print "\n$key => $value\n";
}

sub f_sum2 {
	my $sum = 0;
	for (my $i = 0; $i < @_; $i++) {
		$sum += $_[$i];
	}
	return $sum;
}

print "Scalar context: " . f_func() . "\n";
@mass2 = f_func();
print "List context: @mass2";

sub f_func {
	my @mass = (1..10);
	if(wantarray()) {
		return @mass;
	} else {
		return scalar(@mass);
	}
}

no strict 'refs';

our $var1 = 10;
my $link1 = "var1";
print "\n\$var1 = $$link1";
print "\n\$var1 = ${$link1}";

our $var2 = 5;
my $link2 = "var2";
print "\n\$var2 = $$link2\n";


my $link3 = \$var1;
print ref($link3); #SCALAR, REF, ARRAY, HASH, CODE

my $link4 = \&f_print;
&$link4();
$link4->();

sub f_print {
	print "\nTest\n";
}

sub f_print2 {
	my $txt1 = shift();
	return sub {
		my $txt2 = shift();
		print $txt1, $txt2, "\n";
	}
}

my $link5 = &f_print2('Test');
$link5->('e');
&$link5('t');

sub f_sum3 {
	return ($_[0] + $_[1]);
}
print "2 + 2 = ${\f_sum3(2, 2)}";
