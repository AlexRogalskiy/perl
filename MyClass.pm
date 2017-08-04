package MyClass;
use strict;

#use base qw(ParentClass);
our $VERSION = 2.0;

my $str = "Private string"; #private
our $public_str = "Public string";

my $link_sub = sub { #private
	print "Private method", "\n";
};

sub new {
	my $invocant = shift(); #my $class = shift(); @_
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
	print $link_sub->(), "\n";
}

sub f_set {
	my ( $class ) = shift();
	$str = shift();
	#my $_str = shift();
	#$str = $_str if($_str && $_str =~ /^[0-9]+$/);
}

sub f_get {
	return $str;
}

sub f_print {
	print "Method f_print of Class", "\n";
}

sub AUTOLOAD {
	my $name = our $AUTOLOAD;
	print "\nUnknown method", "\n";
}

sub DESTROY {
	my ( $self ) = @_;
	print "\nMethod DESTROY invoked", "\n";
}
1;