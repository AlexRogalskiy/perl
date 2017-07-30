package MyClass2;
use strict;
use MyClass; #use base qw(ParentClass);

our $VERSION = 2.0;
our @ISA = ("MyClass");

sub new {
	my $class = shift();
	$class = ref($class) if ref($class);
	my $self = $class->SUPER::new();
	bless($self, $class);
	return $self;
}

sub f_new_method {
	print "New Method of Class2", "\n";
}

sub f_display {
	print "Method Display of Class2", "\n";
	#my $self = shift();
	#$self->SUPER::f_display();
}
1;