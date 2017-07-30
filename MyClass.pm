package MyClass;
use strict;

our $VERSION = 2.0;

#use base qw(ParentClass);

my $str = "Private string"; #private
our $public_str = "Public string";

sub new {
	my $invocant = shift();
	my $class = ref($invocant) || $invocant; #$class = ref $class if ref $class;
	my $self = { "var" => 10, @_ }; #my $self = bless {}, $class;
	print $self . "\n";
	print ref($self) . "\n";
	bless($self, $class);
	return $self;
}

sub f_display {
	my $class = shift();
	print "var = ", $class->{"var"}, "\n";
	print "str = ", $class->f_get(), "\n";
}

sub f_set {
	my $class = shift();
	$str = shift();
}

sub f_get {
	return $str;
}

sub AUTOLOAD {
	my $name = our $AUTOLOAD;
	print "\nUnknown methond", "\n";
}

sub DESTROY {
	print "\nMethod DESTROY invoked", "\n";
}

1;