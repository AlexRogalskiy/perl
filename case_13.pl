#!C:\xampp\perl\bin\perl
#/usr/bin/perl
use strict;
use warnings;
#use Fcntl qw(:flock);
#use IO::Seekable;

open(FILE, '>>file.txt') or die("ERROR > $!");
flock(FILE, 2) or die("ERROR > $!"); #LOCK_EX
print FILE "string";

#binmode(FILE);
#print FILE <$file>;

flock(FILE, 8) or die("ERROR > $!"); #LOCK_UN
close(FILE);

#my $text;
#my @text_arr;
open(FILE2, 'file.txt') or die("ERROR > $!");
flock(FILE2, 2) or die("ERROR > $!");
#read(FILE2, $text, 6);

#{
#	local $/ = "";
#	$text = <FILE2>;
#}
#@text_arr = <FILE2>;
#chomp(@text_arr);

while(<FILE2>) {
	print $_, "\n";
}

#print tell(FILE2);
#seek(FILE2, 0, 2); # SEEK_SET=0, SEEK_CUR=1, SEEK_END=2
#truncate(FILE2, 7);

#while ($text = getc(FILE2)) {
#	print $text;
#}

my $file = "file.txt";
if(-e $file) {
	print "File exists\n";
}
if(-z $file) {
	print "File exists and is empty\n";
}
if(-s $file) {
	print -s $file;
}
if(-r $file) {
	print "Read only\n";
}
if(-f $file) {
	print "File type\n";
}
print -C $file; # number of days from creation
print -A $file; # number of days from last access
print -M $file; # number of days from last modification

my @file_stat = stat($file);
for (my $i = 0; $i < @file_stat; $i++) {
	print "$i -> $file_stat[$i]\n";
}

#rename('file.txt', 'file1.txt') or die("ERROR > $!");
#my $count = unlink('file1.txt') or die("ERROR > $!");
#print $count;

#my $ctime = time() - 86400;
#my $count = utime($ctime, $ctime, "file.txt") or die("ERROR > $!");
#my @files = glob("*.txt"); # <*.txt>

#$file =~ m/([^\/\\:]+)$/;
#my $name_file = $1;

#binmode(FILE)
#while (read($file, $buffer, 1024)) {
#	print FILE $buffer;
#}

#sysopen(FILE2, 'file.txt', O_RDONLY) or die("ERROR > $!"); # <
#sysopen(FILE2, 'file.txt', O_WRONLY | O_CREAT | O_TRUNC) or die("ERROR > $!"); # >
#sysopen(FILE2, 'file.txt', O_WRONLY | O_CREAT | O_APPEND) or die("ERROR > $!"); # >>
#sysopen(FILE2, 'file.txt', O_RDWR) or die("ERROR > $!"); # +<
#sysopen(FILE2, 'file.txt', O_RDWR | O_CREAT | O_TRUNC) or die("ERROR > $!"); # +>
#sysopen(FILE2, 'file.txt', O_RDWR | O_CREAT | O_APPEND) or die("ERROR > $!"); # +>>


flock(FILE2, 8) or die("ERROR > $!");
close(FILE2);

use POSIX;
use locale;
setlocale(LC_ALL, "ru_RU.CP1251");
my (@file, @dir, $file_name);
my $path = ".";
chdir($path);
opendir(DIR, $path) or die("ERROR > $!");
foreach (readdir(DIR)) {
	$file_name = $path . $_;
	if (-d $file_name) {
		push(@dir, $_);
	}
	if (-f $file_name) {
		push(@file, $_);
	}
}
closedir(DIR);

for (my $i = 0; $i < @dir; $i++) {
	print "dir: $dir[$i]\n";
}
print "\n\n";

for (my $i = 0; $i < @file; $i++) {
	print "file: $file[$i]\n";
	my @file_stat = stat($path . $file[$i]);
	print "created: " . f_time_file($file_stat[10]) . "\n";
	print "last access: " . f_time_file($file_stat[8]) . "\n";
	print "last modified: " . f_time_file($file_stat[9]) . "\n";
}
print "\n\n";

sub f_time_file {
	my $s = shift();
	return strftime("%d.%m.%Y %H:%M:%S", localtime($s));
}