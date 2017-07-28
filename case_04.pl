#!C:\xampp\perl\bin\perl -w
#/usr/bin/perl -w

#ppm install Encode
use Encode;

print "ENTER name > ";
$name = <STDIN>;
$name = encode("iso-8859-1", $name);
print "Hello, $name!";