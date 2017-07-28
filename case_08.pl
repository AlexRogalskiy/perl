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

#/^[0-9]+$/
#qr/<(.+)>(.*)<\/\1>/;