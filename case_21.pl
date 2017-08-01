#!C:\xampp\perl\bin\perl
#/usr/bin/perl
use strict;
use warnings;

use GD;

my $img1 = new GD::Image(100, 100);
my $red = $img1->colorAllocate(255, 0, 0);
my $img2 = new GD::Image(100, 100);
my $green = $img2->colorAllocate(0, 255, 0);
my $black = $img2->colorAllocate(0, 0, 0);
$img2->filledRectangle(10, 10, 50, 50, $black);
$img1->copy($img2, 2, 2, 9, 9, 43, 43);
binmode(STDOUT);
print $img1->gif();

#---------------------------------------------

#my $path = '';
#my $img1_ = GD::Image->newFromGif($path);
$img1->rotate180();
$img1->flipHorizontal();
$img1->flipVertical();
$img2 = $img1->copyRotate90();
$img2 = $img1->copyRotate180();
$img2 = $img1->copyRotate270();
$img2 = $img1->copyFlipHorizontal();
$img2 = $img1->copyFlipVertical();


my $w_old = $img1->width();
my $h_old = $img1->height();
my $w_new = $img1->width() / 2;
my $h_new = $img1->height() / 2;
my $img2_ = new GD::Image($w_new, $h_new);
my $white = $img2_->colorAllocate(255, 255, 255);
$img2_->transparent($white);
$img2_->copyResized($img1, 0, 0, 0, 0, $w_new, $h_new, $w_old, $h_old);
binmode(STDOUT);
print $img2_->gif();