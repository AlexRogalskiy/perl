package Role::HasPassword;

use Moose::Role;
#use Some::Digest;

has password => (
	is => 'ro',
	isa => 'Str',
);

sub password_digest {
	my ($self) = @_;
	#return Some::Digest->new($self->password);
}