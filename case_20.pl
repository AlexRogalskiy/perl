#!C:\xampp\perl\bin\perl
#/usr/bin/perl
use strict;
use warnings;

use GD;
use Math::Trig;
#use Text::Iconv;

my $img = new GD::Image(120, 100);
my $white = $img->colorAllocate(255, 255, 255);
my $black = $img->colorAllocate(0, 0, 0);
$img->rectangle(0, 0, 119, 99, $black);
my $fontfile = "C://Windows/Fonts/arial.ttf";
#my $Iconv1 = Text::Iconv->new("windows-1251", "UTF-8");
my $str = "Строка"; #$Iconv1->convert("Строка");

my @bounds = GD::Image->stringFT($black, $fontfile, 20, 0, 0, 0, $str);
my $w = int(($img->width() - $bounds[4] - $bounds[6]) / 2);
my $h = int(($img->height() - $bounds[1] - $bounds[7]) / 2);

#$img->stringFT($black, $fontfile, 20, deg2rad(45), 30, 80, $str);
$img->stringFT($black, $fontfile, 20, 0, $w, $h, $str);

binmode(STDOUT);
print $img->gif();