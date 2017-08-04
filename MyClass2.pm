package MyClass2;
use strict;

use base qw( MyClass ); #'MyClass'
our $VERSION = 2.0;
#our @ISA = ("MyClass");

sub new {
	my $class = shift();
	$class = ref($class) if ref($class);
	#my %params = @_;
	#my $self = $class->SUPER::new(%params);
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
	#$self->SUPER::f_display($self);
}
sub f_test {
	#use Test::Simple tests => 1;
	#use Test::More tests => 1;
	#ok() / is() / isnt()
	#like() / unlike()
	#cmp_ok() / can_ok() / isa_ok()
	#use_ok() / require_ok()
	#is_deeply()
	#eq_array() / eq_hash() / eq_set()
	#ok( 1 + 1 == 2 );
}
1;