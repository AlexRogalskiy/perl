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
my $red = $img->colorAllocate(255, 0, 0);
my $white = $img->colorAllocate(255, 255, 255);
my $black = $img->colorAllocate(0, 0, 0);
$img->arc(50, 50 ,80, 80, 0, 360, $white);
$img->filledRectangle(5, 5, 80, 80, $white);
$img->fillToBorder(50, 50, $white, $red);
$img->setThickness(5);
$img->line(20, 50, 70, 50, $red);
$img->filledArc(125, 40, 40, 40, 30, 360, $black, gdChord); # gdArc | gdNoFill | gdEdged

my $color = $img->colorClosest(255, 255, 1);
my ($r, $g, $b) = $img->rgb($color);
print "$r - $g - $b" . "\n";
#$img->fill(50, 50, $red);
#$count = $img->colorsTotal();
my $newColor = $img->getPixel(10, 10);
($r, $g, $b) = $img->rgb($newColor);
print "red: ". $r . ", green: " . $g . ", blue: " . $b . "\n";
$img->transparent($red);

$img->setPixel(50, 50, $white);
#$img->line(20, 50, 70, 50, $white);
#$img->dashedLine(20, 50, 70, 50, $white);
#$img->rectangle(5, 5, 95, 95, $white);
#$img->filledRectangle(6, 6, 96, 96, $white);
#$img->ellipse(50, 50, 60, 30, $white);
#$img->filledEllipse(50, 50, 60, 30, $white);
#$img->arc(50, 50, 50, 50, 0, 360, $white);


my $polygon = GD::Polygon->new();
$polygon->addPt(20, 20);
$polygon->addPt(20, 70);
$polygon->addPt(80, 70);
$polygon->setPt(0, 25, 20);
my ($x, $y) = $polygon->getPt(0);
print "x: $x, y: $y" . "\n";
#$polygon->deletePt(1);
#$polygon->clear();
#$polygon->length();
my @bounds = $polygon->bounds();
print "bound: $bounds[0] - $bounds[1] - $bounds[2] - $bounds[3]" . "\n";
$img->polygon($polygon, $white);
$img->filledPolygon($polygon, $white);

my @vertices = $polygon->vertices();
foreach (@vertices) {
	print join(", ", @$_), "\n";
}

$img->char(gdGiantFont, 4, 40, "S", $white); #gdLargeFont, gdMediumBoldFont, gdSmallFont, gdTinyFont
$img->charUp(gdGiantFont, 5, 60, "T", $white);
$img->string(gdGiantFont, 7, 70, "String", $white);
$img->stringUp(gdGiantFont, 8, 80, "String", $white);
#gdGiantFont->width();
#gdGiantFont->height();

#$img->colorDeallocate($white);
open(IMG, ">img.png");
binmode(IMG);
print IMG $img->gif();
close(IMG);