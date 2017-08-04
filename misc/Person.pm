package Person;

use Moose;

has first_name => (
	is => 'rw',
	isa => 'Str',
);

has last_name => (
	is => 'rw',
	isa => 'Str',
);

my $obj = Person->new(
	first_name => 'V',
	last_name => 'P',
);

print "First name: ", $obj->first_name, ", Last name: ", $obj->last_name, "\n";