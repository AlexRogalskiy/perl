package Test::Untils;

use base 'Test::Class';
use Utils qw(cube);

sub test_cude : Test(2)
{
	my ($self) = @_;
	is(cube(-2), -8, 'negative');
	is(cube(2), 8, 'positive');
	return;
}

#----------------------------------------

cmp_bag(
	[5, '', {v => ''}],
	['', {v => ''}, 3],
	'OK'
);

cmp_deeply(
	$obj,
	methods(name => 'j', ['f', 'ff'] => 't')
);
#$obj->name eq 'j';
#$obj->f->ff eq 't';

#----------------------------------------

use Test::MockObject;

my $mock = Test::MockObject->new();
$mock->set_true('');
ok($mock->method());

$mock->set_true('')->set_false('')->set_series('', '', '', '');

#----------------------------------------

