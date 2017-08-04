package User;

use Moose;
push(@INC, 'C:/Users/Alex/Documents/perl/Perl/misc');
extends 'Person';

has password => (
	is => 'ro',
	isa => 'Str',
);
has age => (
	is => 'ro',
	isa => 'Int',
);
has is_adult => (
	is => 'rw',
	isa => 'Bool',
	lazy => 1,
	builder => '_build_is_adult',
	#default => sub {
	#	my ($self) = @_;
	#	return $self->age >= 18;
	#}
);
has [qw(file_name fh file_content xml_document data)] => (
	lazy_build => 1,
);
sub _build_fh {
	#open (file_name)
}
sub _build_file_content {
	#read(fh)
}
sub _build_xml_document {
	#parse(file_content)
}
sub _build_data {
	#find(xml_document)
}

#----------------------------------------

has doc => (
	is => 'ro',
	isa => 'Item',
	handles => [qw(read write size)],
);
has last_login => (
	is => 'rw',
	isa => 'DateTime',
	handles => { 'date_of_last_login' => 'date' },
);

#{
#	handles => qr/^get_(a|b|c)|set_(a|d|e)$/,
#	handles => 'Role::Name',
#}

#----------------------------------------

#before 'is_adult' => sub { shift->recalculate_age }

#----------------------------------------

sub _build_is_adult {
	return 1;
}

#----------------------------------------

sub BUILD {
	my ( $self ) = @_;
	$self->is_adult($self->age >= 18);
	print "IsAdult: ", $self->is_adult(), "\n";
	return;
}

#----------------------------------------

my $obj = User->new(
	password => 'Pass',
	age => 15,
);

print "Password: ", $obj->password, ", Age: ", $obj->age, ", Is Adult: ", $obj->is_adult(), "\n";

#----------------------------------------
#with 'Role::HasPassword';
#----------------------------------------
#package Config;
#use MooseX::Singleton;
#has 'cache_dir' => ();
#----------------------------------------
#subtype 'ModernDateTime' => as 'DateTime' => where { $_->year() >= 1980 } => message { 'The date you provided is not modern enough' };

#has 'valid_dates' => (
#	is => 'ro',
#	isa => 'ArrayRef[DateTime]',
#);
#----------------------------------------