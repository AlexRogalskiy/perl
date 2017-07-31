#!C:\xampp\perl\bin\perl
#/usr/bin/perl
use strict;
use warnings;

#ppm install http://theoryx5.uwinnipeg.ca/ppms/GD.ppd
#push(@INC, "C:/xampp/perl/vendor/lib/GD");

use GD; #lib "C:/xampp/perl/vendor/lib/GD";
my $myImage;
my $file = 'case_01.pl';
$file =~ m/([^\/\\:]+)$/;
open(FILE, $file) or die("ERROR > $!");
my $name_file = $1;
{
	local $/ = "";
	$myImage = <FILE>;
}
print "file name: " . $name_file . "\n";
my $type = GD::Image::_image_type($myImage);
if($type eq 'Gif' || $type eq 'Jpeg' || $type eq 'Png') {
	print "file type: " . $type . "\n";
}

#my $new_image = GD::Image->newFromPng($file);
#binmode(STDOUT);
#print $new_image->png(0);

my $img = new GD::Image(100, 100);
open(IMG, ">img.png");
binmode(IMG);
print IMG $img->gif();
close(IMG);